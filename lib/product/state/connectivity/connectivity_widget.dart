import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arc/product/state/connectivity/network_checker.dart';
import 'package:flutter_clean_arc/product/utility/enums/app_enums.dart';

class ConnectivityAdaptiveWidget extends StatefulWidget {
  final Widget child;

  const ConnectivityAdaptiveWidget({Key? key, required this.child})
      : super(key: key);

  @override
  _ConnectivityAdaptiveWidgetState createState() =>
      _ConnectivityAdaptiveWidgetState();
}

class _ConnectivityAdaptiveWidgetState
    extends State<ConnectivityAdaptiveWidget> {
  bool _showNoInternetOverlay = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkInitialConnection();
    });
  }

  void _checkInitialConnection() async {
    if (!await context.read<NetworkChecker>().isConnected()) {
      setState(() {
        _showNoInternetOverlay = true;
      });
    }
  }

  Widget _buildNoInternetOverlay() {
    return Material(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.signal_wifi_off, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text(
                'İnternet Bağlantısı Yok',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Lütfen internet bağlantınızı kontrol edin ve tekrar deneyin.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (await context.read<NetworkChecker>().isConnected()) {
                    setState(() {
                      _showNoInternetOverlay = false;
                    });
                  }
                },
                child: Text('Yeniden Dene'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkChecker, NetworkStatus>(
      listener: (context, state) {
        setState(() {
          _showNoInternetOverlay = state == NetworkStatus.disconnected;
        });
      },
      child: Stack(
        children: [
          widget.child,
          if (_showNoInternetOverlay) _buildNoInternetOverlay(),
        ],
      ),
    );
  }
}
