import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
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
                ),
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
            if (widget.postImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
                child: Image.asset(
                  widget.postImage!,
                  height: ScreenUtil().setSp(200),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: ScreenUtil().setSp(10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(8)),
              child: CustomFont(
                text: '${widget.initialLikes} likes',
                fontSize: ScreenUtil().setSp(12),
                color: Colors.grey[600]!,
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(ScreenUtil().setSp(4)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setSp(8),
                        horizontal: ScreenUtil().setSp(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up_outlined,
                            size: ScreenUtil().setSp(20),
                            color: FB_DARK_PRIMARY,
                          ),
                          SizedBox(width: ScreenUtil().setSp(4)),
                          CustomFont(
                            text: 'Like',
                            fontSize: ScreenUtil().setSp(14),
                            color: FB_DARK_PRIMARY,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(ScreenUtil().setSp(4)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setSp(8),
                        horizontal: ScreenUtil().setSp(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.comment_outlined,
                            size: ScreenUtil().setSp(20),
                            color: FB_DARK_PRIMARY,
                          ),
                          SizedBox(width: ScreenUtil().setSp(4)),
                          CustomFont(
                            text: 'Comment',
                            fontSize: ScreenUtil().setSp(14),
                            color: FB_DARK_PRIMARY,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(ScreenUtil().setSp(4)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setSp(8),
                        horizontal: ScreenUtil().setSp(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.share_outlined,
                            size: ScreenUtil().setSp(20),
                            color: FB_DARK_PRIMARY,
                          ),
                          SizedBox(width: ScreenUtil().setSp(4)),
                          CustomFont(
                            text: 'Share',
                            fontSize: ScreenUtil().setSp(14),
                            color: FB_DARK_PRIMARY,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
