enum LeakageStatusEnum {
  processing(
    "Processando",
    "Concentração atual de gás sendo processada.",
    "Não há medidas necessárias.",
    "0xFFD3D0CB",
  ),
  secure(
    "Seguro",
    "Nenhuma concentração de gás detectada.",
    "Não há medidas necessárias.",
    "0xFFA1CF6B",
  ),
  attention(
    "Atenção",
    "Pequena concentração de gás detectada.",
    "Cheque possíveis fontes de vazamento, como butijões de gás e sprays inflamáveis, e as bloqueie o quanto antes.",
    "0xFFE0C879",
  ),
  danger(
    "Perigo",
    "Concentração perigosa de gás detectada. Riscos iminentes de incêndio.",
    "Cheque possíveis fontes de vazamento, abra portas e janelas caso esteja em uma área confinada, evacue o local e chame a emergência. Caso a chave de energia geral se encontre fora do local, desligue-a.",
    "0xFFE87461",
  ),
  critic(
    "Crítico",
    "Grande concentração de gás detectada. Riscos iminentes de explosão e asfixia.",
    "Evacue o local e chame a emergência. Caso a chave de energia geral se encontre fora do local, desligue-a.",
    "0xFFFF0000",
  );

  final String title;
  final String text;
  final String action;
  final String color;

  const LeakageStatusEnum(this.title, this.text, this.action, this.color);
}
