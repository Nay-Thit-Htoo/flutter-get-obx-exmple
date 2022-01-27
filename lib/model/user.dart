class User {
  final int userId;
  final String name;
  final String email;
  final String address;
  final String phone;
  final String repairDate, deleteDate;

  final String profileUrl;

  User(this.userId, this.name, this.email, this.address, this.phone,
      this.profileUrl, this.repairDate, this.deleteDate);
}
