# Array of file names
$files = @(
    "T31_Death_Knight_Blood.simc",
    "T31_Death_Knight_Frost.simc",
    "T31_Death_Knight_Frost_2h.simc",
    "T31_Death_Knight_Unholy.simc",
    "T31_Demon_Hunter_Havoc.simc",
    "T31_Demon_Hunter_Havoc_SD.simc",
    "T31_Demon_Hunter_Vengeance.simc",
    "T31_Druid_Balance.simc",
    "T31_Druid_Feral.simc",
    "T31_Druid_Guardian.simc",
    "T31_Evoker_Devastation.simc",
    "T31_Hunter_Beast_Mastery.simc",
    "T31_Hunter_Marksmanship.simc",
    "T31_Hunter_Marksmanship_Readiness.simc",
    "T31_Hunter_Survival.simc",
    "T31_Mage_Arcane.simc",
    "T31_Mage_Fire.simc",
    "T31_Mage_Frost.simc",
    "T31_Monk_Brewmaster.simc",
    "T31_Monk_Brewmaster_Niuzao.simc",
    "T31_Monk_Windwalker.simc",
    "T31_Paladin_Protection.simc",
    "T31_Paladin_Retribution.simc",
    "T31_Priest_Shadow.simc",
    "T31_Rogue_Assassination.simc",
    "T31_Rogue_Outlaw.simc",
    "T31_Rogue_Subtlety.simc",
    "T31_Shaman_Elemental.simc",
    "T31_Shaman_Enhancement.simc",
    "T31_Shaman_Enhancement_Storm.simc",
    "T31_Warlock_Affliction.simc",
    "T31_Warlock_Demonology.simc",
    "T31_Warlock_Destruction.simc",
    "T31_Warrior_Arms.simc",
    "T31_Warrior_Fury.simc",
    "T31_Warrior_Protection.simc"
)

foreach ($file in $files) {
    # Check if the file name contains "_talent"
    if ($file -notmatch "_talent") {
        # Create the "_talent" file name
        $talentFile = $file -replace '\.simc$', '_talent.simc'

        # Get the first line of the "_talent" file
        $talentContent = Get-Content $talentFile -TotalCount 1

        # Read the content of the non-"_talent" file
        $fileContent = Get-Content $file

        # Replace the content of the 8th row of the non-"_talent" file with the first line of the "_talent" file
        $fileContent[7] = $talentContent

        # Write the modified content back to the non-"_talent" file
        $fileContent | Set-Content $file
    }
}
