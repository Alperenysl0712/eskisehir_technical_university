class Inspection{
  int total;
  int notJoin;
  String? status;

  Inspection(this.total, this.notJoin, this.status);
  Inspection.empty() : total = 0, notJoin = 0, status = null;
}