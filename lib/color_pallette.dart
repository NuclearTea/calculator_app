class ColorPallette {
  int primaryDefault;
  int get getPrimaryDefault => primaryDefault;
  set setPrimaryDefault(int hexCode) => primaryDefault = hexCode;

  int primaryLight;
  int get getPrimaryLight => primaryLight;
  set setPrimaryLight(int hexCode) => primaryLight = hexCode;

  int primaryDark;
  int get getPrimaryDark => primaryDark;
  set setPrimaryDark(int hexCode) => primaryDark = hexCode;

  int secondaryDefault;
  get getSecondaryDefault => secondaryDefault;
  set setSecondaryDefault(int hexCode) => secondaryDefault = hexCode;

  int secondaryLight;
  get getSecondaryLight => secondaryLight;
  set setSecondaryLight(int hexCode) => secondaryLight = hexCode;

  int secondaryDark;
  get getSecondaryDark => secondaryDark;
  set setSecondaryDark(int hexCode) => secondaryDark = hexCode;

  ColorPallette(this.primaryDefault, this.primaryLight, this.primaryDark,
      this.secondaryDefault, this.secondaryLight, this.secondaryDark);

  // ColorPallette(
  //     {required int primaryDefault,
  //     required int primaryLight,
  //     required int primaryDark,
  //     required int secondaryDefault,
  //     required int secondaryLight,
  //     required int secondaryDark});
}
