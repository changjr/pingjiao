package com.fw.vote.service;

import com.fw.vote.dao.MatchPkInfoDao;
import com.fw.vote.dao.VoteDao;
import com.fw.vote.model.MatchPkInfo;
import com.fw.vote.model.User;
import com.fw.vote.model.Vote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service("voteService")
public class VoteServiceimpl implements VoteService {
    @Autowired
    private VoteDao voteDao;
    @Autowired
    MatchPkInfoDao matchPkInfoDao;
    @Override
    public void insert(Vote vote) {
         voteDao.insert(vote);
    }
    @Override
    @Transactional
    public Map<String, Object> save(Vote vote, HttpSession session, String flag) {
        Map<String,Object> map=new HashMap<>();
        User user= (User) session.getAttribute("user");
        if(user==null){
            map.put("flag","0");//请登录
            return map;
        }
        try{
            vote.setUserId(user.getUserid());
            vote.setTicket(1);
            voteDao.insert(vote);
            MatchPkInfo matchPkInfo=matchPkInfoDao.selectById(vote.getBattleId());
            if(flag.equals("0")){
                int i=matchPkInfo.getFirstTicketCount();
                matchPkInfo.setFirstTicketCount(++i);
            }else if(flag.equals("1")){
                int i=matchPkInfo.getSecondTicketCount();
                matchPkInfo.setSecondTicketCount(++i);
            }
            matchPkInfoDao.update(matchPkInfo);
            map.put("flag","2");
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","1");//重复投票
        }
        return map;

    }
}
