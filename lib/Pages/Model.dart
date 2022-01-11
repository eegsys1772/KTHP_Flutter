class phongbanDB {
  String tennhanvien;
  String diachi;
  String chucvu;
  String sodienthoai;
  int luong;
  String gioitinh;
  String tthonnhan;
  String id;

  phongbanDB(
      {this.tennhanvien,
      this.diachi,
      this.chucvu,
      this.sodienthoai,
      this.luong,
      this.gioitinh,
      this.tthonnhan,
      this.id});

  phongbanDB.fromJson(Map<String, dynamic> json) {
    tennhanvien = json['tennhanvien'];
    diachi = json['diachi'];
    chucvu = json['chucvu'];
    sodienthoai = json['sodienthoai'];
    luong = json['luong'];
    gioitinh = json['gioitinh'];
    tthonnhan = json['tthonnhan'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tennhanvien'] = this.tennhanvien;
    data['diachi'] = this.diachi;
    data['chucvu'] = this.chucvu;
    data['sodienthoai'] = this.sodienthoai;
    data['luong'] = this.luong;
    data['gioitinh'] = this.gioitinh;
    data['tthonnhan'] = this.tthonnhan;
    data['id'] = this.id;
    return data;
  }
}
