import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/helpers/ui.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class QRPage extends StatelessWidget {
  const QRPage({super.key});

  Future<void> _onQrCode(Result result, BuildContext context) async {
    if (!result.text.startsWith("D/")) {
      UI.snackbar(context, "QR Inválido");
      return;
    }

    final code = await api.codigo(result.text);

    final msg = code == 200
        ? "Escaneado con éxito"
        : "Ha habido un error al procesar el QR";

    if (!context.mounted) return;

    UI.dialog(context, "Código QR", msg, actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text("OK"),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear código"),
      ),
      body: QRCodeDartScanView(
        scanInvertedQRCode: true,
        typeScan: TypeScan.live,
        onCapture: (result) => _onQrCode(result, context),
      ),
    );
  }
}
