# Rzdtc

Rzd tickets checker

## Usage

```ruby
Rzdtc.check_tickets('КРАСНОДАР', 'РОСТОВ', '24.11.2016')
```

```ruby
Rzdtc.check_tickets('КРАСНОДАР', 'РОСТОВ', '24.11.2016').first

# =>
[
  {"date0"=>"24.11.2016", "varPrice"=>true,
  "date1"=>"24.11.2016", "time0"=>"01:33", "time1"=>"06:04",
  "trDate0"=>"23.11.2016", "trTime0"=>"14:00",
  "deferredPayment"=>false, "route0"=>"СУХУМ",
  "route1"=>"МОСКВА КАЗ", "number"=>"306С",
  "number2"=>"306С", "typeEx"=>"0", "elReg"=>false,
  "uid"=>"306SJ_1479940380000_1479956640000", "train_id"=>"0",
  "bEntire"=>false, "carrier"=>"ФПК", "type"=>"0","station0"=>"КРАСНОДАР",
  "station1"=>"РОСТОВ", "timeInWay"=>"04:31", "flMsk"=>"3",
  "cars"=>[
    {"freeSeats"=>"24", "itype"=>"4", "servCls"=>"2Л",
     "tariff"=>"914", "pt"=>"273", "typeLoc"=>"Купе", "type"=>"Купе"},
    {"freeSeats"=>"36", "itype"=>"1", "servCls"=>"3Л",
     "tariff"=>"572", "pt"=>"171", "typeLoc"=>"Плацкартный", "type"=>"Плац"},
    {"freeSeats"=>"14", "itype"=>"6", "servCls"=>"1Л",
     "tariff"=>"1878", "pt"=>"562", "typeLoc"=>"СВ", "type"=>"Люкс"}
  ]}
]
```


[MIT License](https://github.com/kirqe/rzdtc/blob/master/LICENSE)
