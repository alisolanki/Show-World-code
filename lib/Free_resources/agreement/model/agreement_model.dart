class AgreementModel {
  String artistName = "";
  String producerName = "";
  String panNumber = "";
  String month = "";
  String day = "";
  String directorName = "";
  String productionTitle = "";
  String artistWorkingName = "";
  String place = "";
  String artistAssociaName = "";
  String totalFee = "";
  String signingFee = "";
  String shootingFee = "";
  String postProductionFee = "";
  String perdayFee = "";

  AgreementModel(
      {this.artistAssociaName,
      this.artistName,
      this.artistWorkingName,
      this.day,
      this.directorName,
      this.month,
      this.panNumber,
      this.perdayFee,
      this.place,
      this.postProductionFee,
      this.producerName,
      this.productionTitle,
      this.shootingFee,
      this.signingFee,
      this.totalFee});
}
