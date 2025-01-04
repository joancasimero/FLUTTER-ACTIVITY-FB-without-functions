import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart'; 
import '../constants.dart';
import '../widgets/customfont.dart';

class NewsfeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final String? postImage; 
  final int initialLikes;
  final String? profileImage; 

  const NewsfeedCard({
    Key? key,
    required this.userName,
    required this.postContent,
    this.postImage,
    this.initialLikes = 0,
    this.profileImage,
  }) : super(key: key);

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  int _likes = 0;
  bool _isLiked = false;
  List<String> _comments = [];

  @override
  void initState() {
    super.initState();
    _likes = widget.initialLikes;
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likes += _isLiked ? 1 : -1;
    });
  }

  void _addComment(String comment) {
    setState(() {
      _comments.add(comment);
    });
  }

  void _sharePost() {
    Share.share('${widget.userName}: ${widget.postContent}');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info row with avatar
            Row(
              children: [
                _buildProfilePicture(),
                SizedBox(width: ScreenUtil().setSp(10)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFont(
                        text: widget.userName,
                        fontSize: ScreenUtil().setSp(15),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomFont(
                        text: '2 hours ago',
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: ScreenUtil().setSp(10)),
            CustomFont(
              text: widget.postContent,
              fontSize: ScreenUtil().setSp(14),
              color: Colors.black87,
            ),
            SizedBox(height: ScreenUtil().setSp(10)),
            if (widget.postImage != null) _buildPostImage(),
            SizedBox(height: ScreenUtil().setSp(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(8)),
              child: CustomFont(
                text: '$_likes likes',
                fontSize: ScreenUtil().setSp(12),
                color: Colors.grey[600]!,
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(
                  icon: _isLiked
                      ? Icons.thumb_up
                      : Icons.thumb_up_outlined, 
                  label: 'Like',
                  onPressed: _toggleLike,
                ),
                _ActionButton(
                  icon: Icons.comment_outlined,
                  label: 'Comment',
                  onPressed: () {
                    _showCommentDialog(context);
                  },
                ),
                _ActionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onPressed: _sharePost, 
                ),
              ],
            ),
            if (_comments.isNotEmpty) ...[
              Divider(),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setSp(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _comments
                      .map((comment) => Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: ScreenUtil().setSp(4)),
                            child: CustomFont(
                              text: comment,
                              fontSize: ScreenUtil().setSp(12),
                              color: Colors.black87,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Container(
      width: ScreenUtil().setSp(40),
      height: ScreenUtil().setSp(40),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(20)),
        child: widget.profileImage != null
            ? Image.asset(
                widget.profileImage!,
                fit: BoxFit.cover,
              )
            : Container(
                color: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  size: ScreenUtil().setSp(24),
                  color: Colors.grey[600],
                ),
              ),
      ),
    );
  }

  Widget _buildPostImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
      child: Image.asset(
        widget.postImage!,
        height: ScreenUtil().setSp(200),
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  void _showCommentDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add a comment'),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Write your comment...'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                _addComment(_controller.text);
                Navigator.pop(context);
              }
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(ScreenUtil().setSp(4)),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setSp(8),
            horizontal: ScreenUtil().setSp(16),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: ScreenUtil().setSp(20),
                color: FB_DARK_PRIMARY,
              ),
              SizedBox(width: ScreenUtil().setSp(4)),
              CustomFont(
                text: label,
                fontSize: ScreenUtil().setSp(14),
                color: FB_DARK_PRIMARY,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
