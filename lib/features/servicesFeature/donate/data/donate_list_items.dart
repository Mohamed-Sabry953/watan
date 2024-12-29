import 'package:final_project_2024/core/utils/constant/images.dart';
import 'package:final_project_2024/features/servicesFeature/donate/data/donate_data_model.dart';
class DonateListItems{
  static List<DonateDataModel> items = [
    DonateDataModel(
        title: "Magdi Yacoub Foundation",
        mainContent: "It was established in 2008 in Egypt. It is a non-profit organization that aims to provide high-quality medical care for heart patients, <br /> <br /> train medical personnel, and conduct advanced research in the field of heart diseases. The foundation's heart center is located in Aswan",
        image: Images.magdy,
        images: [
          Images.magdiOne,Images.magdiTwo,Images.magdiThree,Images.magdiFour,Images.magdiFive,Images.magdiSix,Images.magdiSeven,Images.magdiEight
        ],
        address: "Aswan International Airport Road, Aswan, Egypt.",
        link: "https://www.myf-egypt.org/app_ar.arb/",
        phoneNumber: "Hotline: 19731 (within Egypt)",
        details: "Since its inception, the Foundation has performed more than 50,000 surgeries.Provides more than 12,000 free medical consultations annually.Contributed to saving the lives of thousands of patients"),
    DonateDataModel(
        title: "AlAin Social Care Foundation",
        mainContent: "It is one of the most prominent charitable institutions in Iraq, established with the aim of caring for orphans, poor and needy families, and providing them with support in various aspects of life. The foundation operates under the supervision of the office of the Supreme Religious Authority, Sayyid Ali al-Sistani, which gives its work an air of trust and transparency.",
        image: Images.alain,
        images: [
          Images.alainOne,Images.alainTwo,Images.alainThree,Images.alainFour,Images.alainFive,Images.alainSix
        ],
        address: "Baghdad, Al-Kadhimiya, the shrine of Imam Al-Kadhim.",
        link: "https://aynyateem.com/",
        phoneNumber: "+964 (780) 777-7777",
        details:"Sponsoring more than 100,000 orphans in various governorates of Iraq, establishing fully equipped residential complexes to house orphans and their families in a safe environment, building free or low-cost health centers to provide health care to those in need."),
        DonateDataModel(
        title: "Hospital 57357",
        mainContent: "It is one of the largest hospitals specializing in pediatric cancer treatment in the world, located in Cairo, Egypt. The hospital was established in 2007,and relies heavily on donations to support its medical and therapeutic services.The hospital aims to provide high-quality healthcare to children with cancer free of charge.",
        image: Images.h57357,
        images: [
          Images.h57357One,Images.h57357Two,Images.h57357Three
        ],
        address: "1 Sekkat El Imam Street, Old Slaughterhouse Area, Sayeda Zeinab, Cairo.",
        link: "https://www.57357.org/en/home-page/",
        phoneNumber: "57357 For Donations",
        details:"The hospital's cure rate reaches about 75%-80% for some types of cancer, which is close to global rates in developed countries such as the United States and Europe. The hospital started with a capacity of 185 beds, then expanded to reach 320 beds, with ongoing plans to add more beds to meet the increasing demand for medical services."),
    DonateDataModel(
        title: "King Faisal Specialist Hospital",
        mainContent: "It is one of the most prominent hospitals in the Kingdom of Saudi Arabia and the Middle East region, and is a leading hospital in providing specialized medical care.The hospital was established in 1975 in Riyadh and has other branches in Jeddah and Medina.",
        image: Images.fasial,
        images: [
          Images.fasilOne,Images.fasilTwo,Images.fasilThree,Images.fasilFour,Images.fasilFive,Images.fasilFive,Images.fasilSix,Images.fasilSeven
        ],
        address: "Riyadh, Saudi Arabia.",
        link: "https://www.kfshrc.edu.sa/",
        phoneNumber: "+966 11 477 5711",
        details: "The hospital features innovative surgical programs, including robotic heart surgery that has achieved amazing results. Over the past few years, the hospital has performed more than 400 robotic heart surgeries, with a patient survival rate of up to 98%."),
    DonateDataModel(
        title: "Palestine Red Crescent Foundation",
        mainContent: "It is one of the oldest and most important humanitarian and charitable organizations in Palestine.It was established in 1968 as a national non-governmental organization that provides health, relief, and development services to the Palestinian community.The organization works to improve the quality of life for Palestinians,",
        image: Images.red,
        images: [
          Images.redOne,Images.redTwo,Images.redThree,Images.redFour,Images.redFive,Images.redSix,Images.redSeven,Images.redSeven,
        ],
        address: "Al-Bireh, West Bank.",
        link: "https://www.palestinercs.org/en",
        phoneNumber: "+972 2 297 8520",
        details: "Management of hospitals and medical centers, response to humanitarian crises, training and health awareness, providing psychosocial support,"),
    DonateDataModel(
        title: "Resala Charity Organization",
        mainContent: "It is one of the charitable non-governmental organizations in Egypt,established with the aim of improving the social and economic conditions of the most needy families.The association works in various fields including education, healthcare, community development, and microfinance.",
        image: Images.resala,
        images: [
          Images.resalaOne,Images.resalaTwo,Images.resalaThree,Images.resalaFour,Images.resalaFive,Images.resalaSix
        ],
        address: "El Geish Street, Mansoura City, Dakahlia Governorate, Egypt.",
        link: "https://resala.org/",
        phoneNumber: "19450",
        details: "Health activities: medical clinics, medical convoys and Development projects: micro-projects, housing projects"),
  ];
}
