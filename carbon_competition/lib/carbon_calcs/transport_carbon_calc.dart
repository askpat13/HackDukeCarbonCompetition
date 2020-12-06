// Sources: https://nepis.epa.gov/Exe/ZyNET.exe/P100JPPH.TXT?ZyActionD=ZyDocument&Client=EPA&Index=2011+Thru+2015&Docs=&Query=&Time=&EndTime=&SearchMethod=1&TocRestrict=n&Toc=&TocEntry=&QField=&QFieldYear=&QFieldMonth=&QFieldDay=&IntQFieldOp=0&ExtQFieldOp=0&XmlQuery=&File=D%3A%5Czyfiles%5CIndex%20Data%5C11thru15%5CTxt%5C00000011%5CP100JPPH.txt&User=ANONYMOUS&Password=anonymous&SortMethod=h%7C-&MaximumDocuments=1&FuzzyDegree=0&ImageQuality=r75g8/r75g8/x150y150g16/i425&Display=hpfr&DefSeekPage=x&SearchBack=ZyActionL&Back=ZyActionS&BackDesc=Results%20page&MaximumPages=1&ZyEntry=1&SeekPage=x&ZyPURL
// https://www.carbonindependent.org/20.html
// https://www.bbc.com/news/science-environment-49349566
import '../user_class.dart';

var transportCarbonConstants = {
  "car":8.887, // kg carbon per gallon burned
  "bus":0.104, //kg carbon per km
  "coach bus":0.027, //kg carbon per km
  "train":0.041, //kg carbon per km
  "plane":0.225, //kg per km
  "electric train":0.006, //kg per km
};

double calcCarbonFromTransport(String transportType, double mileCount) {
  double milesToKm = 1.60934;

  return transportCarbonConstants[transportType] * milesToKm * mileCount;
}

double calcCarbonFromCar(double mileCount) {
  return (transportCarbonConstants["car"] * mileCount) / User.userMpg;
}