// Lightweight no-op XP animation shim.
// The project removed visual XP animations; keep this shim so existing
// call sites remain compatible. This avoids breaking imports and
// makes it easier to fully remove the file later if desired.
class XpAnimation {
  static void show(dynamic /* BuildContext */ context, int xp) {
    // intentionally no-op
  }
}
