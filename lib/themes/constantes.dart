import 'package:flutter/cupertino.dart';

class Cores {
  static const Color corConfirmar = Color(0xFF48BEFD);
  static const Color corBotaoFlutuante = Color(0xFF2854AA);
  static const Color corDialogo = Color(0xFFF3F3F3);
  static const Color corTextDialogo = Color(0xFF6C6B6B);
  static const Color corBotaoCancelarECaixaTexto = Color(0xFFD5D5D5);
  static const Color corItensParaFazer = Color(0xFFF1F1F1);
}

class TamanhoTela {
  double alturaTela(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double larguraTela(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
