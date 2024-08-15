package BenchmarkEducation.Datagenerator;

import net.datafaker.Faker;



public class RandomdataGenerator {
    static Faker faker = new Faker();

    public static String randomName(){

        
        String fullname = faker.name().fullName();
        return fullname;

    }

    public static String randomId(int size) {
        return faker.number().digits(size);

    }

    public static String getRandomEmail(){

        String email = faker.name().firstName() + faker.random().nextInt(3) + "@test.com";
        return email;

    }


    public static String getGender(){
        return faker.gender().binaryTypes();
    }
    public static Integer getNumber(){
       return faker.random().nextInt(1, 99);
    }
}
