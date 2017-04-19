/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se313h21.j2eeweb.repositories;

import com.se313h21.j2eeweb.model.AccessToken;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Stevie
 */
public class Utils {
    public static boolean isValidToken(AccessTokenRepository atRepo,
            String candidateToken){
        List<AccessToken> lists = atRepo.findByAccessToken(candidateToken);
        if (atRepo.findByAccessToken(candidateToken).isEmpty()){
            return false;
        }
        return lists.get(0).getExpired() > currentTimestamp();
    }   
    
    public static double currentTimestamp(){
        return (new Date()).getTime() /1000;
    }
}
