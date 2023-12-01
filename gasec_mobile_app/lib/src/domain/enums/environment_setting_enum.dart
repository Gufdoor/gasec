enum EnvironmentSettingEnum {
  indoor("Área interna", 1.0),
  outdoor("Área externa", 1.15),
  forest("Mata aberta", 1.6);

  final String title;
  final double ratio;

  const EnvironmentSettingEnum(
    this.title,
    this.ratio,
  );
}
