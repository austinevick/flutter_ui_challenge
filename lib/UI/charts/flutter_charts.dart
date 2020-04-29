import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
        year: '2008',
        subscribers: 1000000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SubscriberSeries(
        year: '2009',
        subscribers: 1100000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SubscriberSeries(
        year: '2010',
        subscribers: 1200000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SubscriberSeries(
        year: '2011',
        subscribers: 1300000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SubscriberSeries(
        year: '2012',
        subscribers: 1400000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SubscriberSeries(
        year: '2013',
        subscribers: 1500000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SubscriberSeries(
        year: '2014',
        subscribers: 1600000,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    SubscriberSeries(
        year: '2015',
        subscribers: 100000,
        barColor: charts.ColorUtil.fromDartColor(Colors.red)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World of warcraft subcribers'),
      ),
      body: Container(
        child: Center(child: 
        SubscriberChart(data: data,),),
      ),
    );
  }
}

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;

  const SubscriberChart({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: 'subscribers',
          data: data,
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  'World of warCraft subscribers by year',
                  style: Theme.of(context).textTheme.body2,
                ),
                Expanded(
                    child: charts.BarChart(
                  series,
                  animate: true,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;

  SubscriberSeries({this.year, this.subscribers, this.barColor});
}
