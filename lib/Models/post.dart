


class Post {
  String id;
  String title;
  String content;
  String dateWritten;
  String featuredImage;
  int voteUp;
  int voteDown;
  List<int> votersUp ;
  List<int> votersDown ;
  int userId;
  String categoryId;
  String createdAt;
  String updatedAt;

  Post({this.id, this.title, this.content, this.dateWritten, this.featuredImage,
      this.voteUp, this.voteDown, this.votersUp, this.votersDown, this.userId,
      this.categoryId, this.createdAt, this.updatedAt});



}