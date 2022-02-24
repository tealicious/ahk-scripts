XButton2::
    healMerc()
return

healMerc() {
    if (mercenaryPotionColumnCount > 4 || mercenaryPotionColumnCount < 1) {
        mercenaryPotionColumnCount := 4
    }
    if (potionIdx >= mercenaryPotionColumnCount) {
        potionIdx := 1
    } else {
        potionIdx += 1
    }
    Send {Shift Down}
    Send %potionIdx%
    Send {Shift Up}
}