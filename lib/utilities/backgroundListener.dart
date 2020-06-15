import 'dart:async';
import 'apiCalls.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;
import 'package:background_fetch/background_fetch.dart';


//------------------------------------------------------------------------------
StreamSubscription<HardwareButtons.VolumeButtonEvent> _volumeButtonSubscription;
StreamSubscription<HardwareButtons.HomeButtonEvent> _homeButtonSubscription;
StreamSubscription<HardwareButtons.LockButtonEvent> _lockButtonSubscription;
String fecha;


//Metodos encargados de registrar las pulsaciones de los diferentes botones físicos del dispositivo
void eventoBotonVolumen() async
{
  _volumeButtonSubscription = HardwareButtons.volumeButtonEvents.listen((event) async
  {
    fecha = new DateTime.now().toString();

    if(event.toString().indexOf("VolumeButtonEvent.VOLUME_UP") == -1)
    {
      crearRegistro("F/VolumenUp", 'null', fecha, fecha);
    }
    else
    {
      crearRegistro("F/VolumenDown", 'null', fecha, fecha);
    }
  });
}

void eventoBotonHome()
{
  _homeButtonSubscription = HardwareButtons.homeButtonEvents.listen((event) {
    print('HOME_BUTTON');
  });
}
void eventoBotonLock()
{
  _lockButtonSubscription = HardwareButtons.lockButtonEvents.listen((event) {
    print('LOCK_BUTTON');
  });
}
void cerrarEventosBotones()
{
  _volumeButtonSubscription?.cancel();
  _homeButtonSubscription?.cancel();
  _lockButtonSubscription?.cancel();
}

void pruebaStart()
{
  BackgroundFetch.start().then((int status) {

    print('[BackgroundFetch] start success: $status');
  }).catchError((e) {
    print('[BackgroundFetch] start FAILURE: $e');
  });

}


Future<void> initPlatformState() async {

  // Configure BackgroundFetch.
  BackgroundFetch.configure(BackgroundFetchConfig(
    minimumFetchInterval: 15,
    forceAlarmManager: false,
    stopOnTerminate: false,
    startOnBoot: true,
    enableHeadless: true,
    requiresBatteryNotLow: false,
    requiresCharging: false,
    requiresStorageNotLow: false,
    requiresDeviceIdle: false,
    requiredNetworkType: NetworkType.NONE,
  ),
      _onBackgroundFetch).then((int status) {
    print("todo correcto");
  }).catchError((e) {
    print('[BackgroundFetch] configure ERROR: $e');
  });
}

void _onBackgroundFetch(String taskId) async
{
  // This is the fetch-event callback.
  print("[BackgroundFetch] Event received: $taskId");

  eventoBotonVolumen();

  // Schedule a one-shot task when fetch event received (for testing).
  BackgroundFetch.scheduleTask(TaskConfig(
      taskId: "pepe",
      delay: 10000,
      periodic: false,
      forceAlarmManager: true,
      stopOnTerminate: false,
      enableHeadless: true
  ),);

  // IMPORTANT:  You must signal completion of your fetch task or the OS can punish your app
  // for taking too long in the background.
  BackgroundFetch.finish(taskId);
}







