import 'package:flutter/material.dart';
import 'package:openuma/common.dart';
import 'package:openuma/helpers/ui.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class QRPage extends StatelessWidget {
  const QRPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear código"),
      ),
      body: QRCodeDartScanView(
        scanInvertedQRCode: true,
        typeScan: TypeScan.live,
        onCapture: (Result result) {
          if (result.text.startsWith("D/")) {
            final res = api.codigo(result.text);
            res.then((value) {
              UI.dialog(
                context,
                "Código QR",
                value == 200
                    ? "Escaneado con éxito"
                    : "Ha habido un error al procesar el QR",
                actions: [
                  // TODO: AGREGAR MENSAJE DE VUELTA
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK")),
                ],
              );
            });

            return;
          }

          UI.snackbar(context, "QR Inválido");
        },
      ),
    );
  }
}
