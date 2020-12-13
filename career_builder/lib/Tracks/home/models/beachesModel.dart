class BeachesModel {
  String title;
  String desc;
  String img;
  int id;
//  bool isActive;

  BeachesModel({
    this.title,
    this.desc,
    this.img,
    this.id
//    this.isActive
  });

}

List<BeachesModel> beaches = [

   BeachesModel(
    title: "Mobile Development",
    desc: "frontend and backend courses",
    img: "assets/Tracks/home/mob1.jpg",
    id: 1
  ),
  BeachesModel(
    title: "Web development",
    desc: "no matter what you will do",
    img: "assets/Tracks/home/web2.jpg",
    id: 2
  ),
  BeachesModel(
    title: "Desktop",
    desc: "thank u so much for this",
    img: "assets/Tracks/home/desc1.jpg",
    id: 3
  ),
  BeachesModel(
    title: "networking",
    desc: "support us and be smart",
    img: "assets/Tracks/home/net2.jpg",
    id: 4

  ),
  BeachesModel(
    title: "Others",
    desc: "support us or go Ahead",
    img: "assets/Tracks/home/data1.jpg",
     id: 5
  )

];