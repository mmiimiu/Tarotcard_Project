class TarotCard {
  final String name;
  final String image;
  final String category;
  final Map<String, String> meaning;

  TarotCard({
    required this.name,
    required this.image,
    required this.category,
    required this.meaning,
  });
}

final List<TarotCard> tarotDeck = [

  TarotCard(
    name: "The Fool",
    image: "assets/fool.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน หมายถึงการเริ่มต้นกิจการใหม่ๆ หรือหมายถึงการเบื่อๆเรื่องงานอยากไปพักร้อน",
      "love": "ความรัก หมายถึงคนเจ้าชู้และอิสระสูงไม่ชอบให้แฟนมาคุม",
    },
  ),

  TarotCard(
    name: "The Magician",
    image: "assets/magician.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน เหมาะกับงานที่เกี่ยวข้องกับคนจำนวนมาก เช่น พิธีกร ดีเจ วีเจ งานการสอนก็ดี เพราะสามารถสื่อให้คนเข้าใจได้ง่าย หรือทำงานไม่ตรงกับสายที่เรียนมา",
      "love": "ความรัก คนรักใหม่และคนรักเก่าจะมาในช่วงที่คุณไม่อยากมีความรักเท่าใดนัก หากแอบชอบใครอยู่อาจไม่สมหวัง",
    },
  ),

  TarotCard(
    name: "The High Priestess",
    image: "assets/high_priestess.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ธุรกิจจะดำเนินไปอย่างเชื่องช้าในระยะแรก อาชีพที่เหมาะสมคือศิลปินทุกรูปแบบ หรือ งานสืบสวน",
      "love": "ความรัก ในท่านชายอาจพบหญิงที่มีเสน่ห์น่าหลงใหล ในท่านหญิงอาจเป็นรักข้างเดียวหรือรักซ้อน",
    },
  ),

  TarotCard(
    name: "The Empress",
    image: "assets/empress.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน เหมาะกับการค้าขายของสวยงาม หรือสินค้าอิเล็กทรอนิกส์ งานอาจต้องแก้ไขก่อนสำเร็จ",
      "love": "ความรัก เป็นไพ่แห่งความสมหวัง อาจหมายถึงการแต่งงาน การตั้งครรภ์ หรือความรักที่ลึกซึ้ง",
    },
  ),

  TarotCard(
    name: "The Emperor",
    image: "assets/emperor.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน เกี่ยวกับองค์กรใหญ่ เทคโนโลยี การเมือง หรือราชการ มีความมั่นคงสูง",
      "love": "ความรัก หมายถึงการพบคู่แท้ หรือคิดถึงคนรัก",
    },
  ),

  TarotCard(
    name: "The Hierophant",
    image: "assets/hierophant.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน มีปัญหาจุกจิก เหมาะกับอาชีพครู แพทย์ หรือราชการ",
      "love": "ความรัก มักได้แต่งงานช้า หรือคู่มีอายุมากกว่า",
    },
  ),

  TarotCard(
    name: "The Lovers",
    image: "assets/lovers.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน อาจเปลี่ยนงาน หรือมีโอกาสใหม่เข้ามา",
      "love": "ความรัก อยู่ในช่วงมีความรัก หรือจะได้พบคนที่ใช่",
    },
  ),

  TarotCard(
    name: "The Chariot",
    image: "assets/chariot.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน เหมาะกับงานเดินทาง ขนส่ง หรือใช้ภาษา",
      "love": "ความรัก คนโสดอาจพบรักใหม่ คนมีคู่ต้องห่างกันชั่วคราว",
    },
  ),

  TarotCard(
    name: "Strength",
    image: "assets/strength.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ได้รับผลสำเร็จจากความพยายาม",
      "love": "ความรัก ต้องใช้เวลาในการพัฒนา",
    },
  ),

  TarotCard(
    name: "The Hermit",
    image: "assets/hermit.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน เหมาะกับงานระยะยาว เช่น นักวิชาการ แพทย์",
      "love": "ความรัก รู้สึกเหงา หรือคนเก่ากลับมา",
    },
  ),

  TarotCard(
    name: "Wheel of Fortune",
    image: "assets/wheel.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ต้องการพัฒนา หรือเปลี่ยนแปลง",
      "love": "ความรัก ขึ้นๆลงๆ อาจมีคนเก่ากลับมา",
    },
  ),

  TarotCard(
    name: "Justice",
    image: "assets/justice.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ได้รับความยุติธรรม เหมาะกับงานบัญชี กฎหมาย",
      "love": "ความรัก ระวังคนเข้ามาแล้วจากไป",
    },
  ),

  TarotCard(
    name: "The Hanged Man",
    image: "assets/hanged_man.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ต้องอดทน มีอุปสรรค",
      "love": "ความรัก ยังไม่ควรทุ่มเทมากเกินไป",
    },
  ),

  TarotCard(
    name: "Death",
    image: "assets/death.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน มีความเปลี่ยนแปลง หรือจบเพื่อเริ่มใหม่",
      "love": "ความรัก อาจจบความสัมพันธ์",
    },
  ),

  TarotCard(
    name: "Temperance",
    image: "assets/temperance.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน อาจย้ายงาน หรือเดินทาง",
      "love": "ความรัก เลิกแล้วกลับมาคืนดี",
    },
  ),

  TarotCard(
    name: "The Devil",
    image: "assets/devil.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน มีรายได้เสริมหรือเกี่ยวข้องกับอบายมุข",
      "love": "ความรัก มีแรงดึงดูดสูง แต่ไม่ยั่งยืน",
    },
  ),

  TarotCard(
    name: "The Tower",
    image: "assets/tower.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ปัญหาเกิดกะทันหัน",
      "love": "ความรัก อกหัก หรือเลิกรา",
    },
  ),

  TarotCard(
    name: "The Star",
    image: "assets/star.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน มีความหวัง งานด้านศิลปะดี",
      "love": "ความรัก มักยังโสด ใช้เวลากับเพื่อน",
    },
  ),

  TarotCard(
    name: "The Moon",
    image: "assets/moon.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ต้องระวังปัญหาและคนกลั่นแกล้ง",
      "love": "ความรัก อาจถูกหลอก หรือไม่ชัดเจน",
    },
  ),

  TarotCard(
    name: "The Sun",
    image: "assets/sun.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน สำเร็จ ได้งานใหม่",
      "love": "ความรัก จะได้คู่ที่ดี",
    },
  ),

  TarotCard(
    name: "Judgement",
    image: "assets/judgement.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ได้งานใหม่จากคนรู้จัก",
      "love": "ความรัก คนเก่ากลับมาให้ตัดสินใจ",
    },
  ),

  TarotCard(
    name: "The World",
    image: "assets/world.jpg",
    category: "GENERAL",
    meaning: {
      "career": "การงาน ประสบความสำเร็จตามเป้าหมาย",
      "love": "ความรัก สมบูรณ์ มีโอกาสมีครอบครัว",
    },
  ),
];