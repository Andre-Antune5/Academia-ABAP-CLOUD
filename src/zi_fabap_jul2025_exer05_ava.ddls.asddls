@EndUserText.label: 'Exercício 3 - Table Function'
define table function ZI_FABAP_JUL2025_EXER05_AVA
returns
{ 
  key client     : abap.clnt;
  key travel_id  : /dmo/travel_id;
  key booking_id : /dmo/booking_id;
  booking_date  : /dmo/booking_date;
  customer_id   : /dmo/customer_id;
  carrier_id    : /dmo/carrier_id;
  connection_id : /dmo/connection_id;
  flight_date   : /dmo/flight_date;  
  flight_price  : /dmo/flight_price;
  currency_code : /dmo/currency_code;

}
implemented by method ZCL_FABAP_JUL2025_EXER05_AVA=>GET_DATA;