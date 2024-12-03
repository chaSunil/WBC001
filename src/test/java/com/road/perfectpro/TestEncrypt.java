package com.road.perfectpro;

import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.SimpleStringPBEConfig;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class TestEncrypt {

    @Test
    public void testEncrypt() {
        PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor();
        SimpleStringPBEConfig config = new SimpleStringPBEConfig();
        config.setPassword("wbcadmin0420");
        config.setAlgorithm("PBEWithMD5AndDES");
        config.setKeyObtentionIterations(1000);
        config.setPoolSize(1);
        config.setSaltGeneratorClassName("org.jasypt.salt.RandomSaltGenerator");
        config.setStringOutputType("base64");
        encryptor.setConfig(config);
        
        String mailPassword = encryptor.encrypt("jpfs vgws qyru huun");
        String dbPassword = encryptor.encrypt("1234");
        
        assert mailPassword != null : "메일 비밀번호 암호화 실패";
        assert dbPassword != null : "DB 비밀번호 암호화 실패";
        
        System.err.println("Mail Password Encrypted: " + mailPassword);
        System.err.println("DB Password Encrypted: " + dbPassword);
        
        String decryptedMailPw = encryptor.decrypt(mailPassword);
        String decryptedDbPw = encryptor.decrypt(dbPassword);
        
        assert "jpfs vgws qyru huun".equals(decryptedMailPw) : "메일 비밀번호 복호화 실패";
        assert "1234".equals(decryptedDbPw) : "DB 비밀번호 복호화 실패";
    }
}