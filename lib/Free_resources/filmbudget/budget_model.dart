class BudgetModel {
  var _budgetModel = {
    "Script": ["Story", "Sreenplay", "Dialogues"],
    "Director": ["Assistants"],
    "Music": [
      "Music Director",
      "Lyricists",
      "Song Recording",
      "Playback Singers",
      "Background"
    ],
    "Dances": ["Dance Directors", "Dancers", "Assistants"],
    "Action": ["Stunt Director", "Assistants", "Fighters", "Stunt Effects"],
    "Digital Stock": ["Chip/Tapes", "Hard Disk/DVDs"],
    "Costumes": ["Dresses/Ornaments", "Costume Designers", "Wigs/Accessories"],
    "Settings": ["Set Materials", "Properties", "Workers"],
    "Location": ["Location", "Studio Hire"],
    "Outdoor": ["Traveling", "Lodging/Boarding", "Allowances"],
    "Technicians": [
      "Cinematographers",
      "Sound Recordists",
      "Editor",
      "Make-Up Professional",
      "Dress-man",
      "Still Photographer",
      "Art Director"
    ],
    "Artistes": ["Leading Artistes", "Character Artistes", "Junior Artistes"],
    "Post Production": [
      "Editing/Dubbing",
      "Special Effects",
      "Final Mixing/DI/Preview"
    ],
    "Daily Shooting Expenditure": [
      "Food",
      "Daily worker",
      "Spotboys/Lightmen/Equipment/Transport/Attendants"
    ],
    "Production and Office Expenditure": [
      "Prod. Executive",
      "Prod. Manager",
      "Prod. Assistant/Accountant",
      "Office Staff"
    ],
    "Equipments": ["Camera/Sound/Lights", "Special Equipments", "Vanity Vans"],
    "Publicity Expenditure": [
      "PRO/Advt.",
      "Brochure/Show cards",
      "Posters/TV Promotions",
      "Radio/Outdoor Publicity",
      "Banners/Socia Media"
    ],
    "Miscellaneous": ["Interest/Censor"],
    "Release Expenditure": ["Distribution", "Digital Expenditure"],
  };

  Map<String, List<String>> get budgetModel {
    return _budgetModel;
  }
}
