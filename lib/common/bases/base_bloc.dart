import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'base_event.dart';

abstract class BaseBloc {

  final StreamController<BaseEvent> _eventStreamController = StreamController();
  Sink<BaseEvent> get eventSink => _eventStreamController.sink;

  final StreamController<String> _messageController = BehaviorSubject();
  Stream<String> get messageStream => _messageController.stream;
  Sink<String> get messageSink => _messageController.sink;

  final StreamController<bool> _loadingController = StreamController.broadcast();
  Stream<bool> get loadingStream => _loadingController.stream;
  Sink<bool> get loadingSink => _loadingController.sink;


  final StreamController<BaseEvent> _progressController = BehaviorSubject();
  Stream<BaseEvent> get progressStream => _progressController.stream;
  Sink<BaseEvent> get progressSink => _progressController.sink;

  BaseBloc(){
    _eventStreamController.stream.listen((event) {
      dispatch(event);
    });
  }

  void dispatch(BaseEvent event);

  void dispose() {
    _eventStreamController.close();
    _loadingController.close();
    _progressController.close();
  }
}