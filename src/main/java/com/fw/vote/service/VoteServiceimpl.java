package com.fw.vote.service;

import com.fw.vote.dao.MatchPkDao;
import com.fw.vote.dao.VoteDao;
import com.fw.vote.model.MatchPk;
import com.fw.vote.model.User;
import com.fw.vote.model.Vote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("voteService")
public class VoteServiceimpl implements VoteService {
    @Autowired
    private VoteDao voteDao;
    @Autowired
    MatchPkDao matchPkDao;
    @Override
    public void insert(Vote vote) {
         voteDao.insert(vote);
    }
    @Override
    @Transactional
    public Map<String, Object> save(Vote vote, HttpSession session) {
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
            MatchPk matchPk=matchPkDao.selectById(vote.getBattleId());
    
            int i = matchPk.getSecondTicketCount();
            matchPk.setSecondTicketCount(++i);
            matchPkDao.updateMatchPk(matchPk);
            map.put("flag","2");
            map.put("msg","投票成功");
            map.put("matchId",matchPk.getMatchId());
        }catch (Exception e){
            e.printStackTrace();
            map.put("flag","1");//重复投票
            map.put("msg","投票重复");
        }
        return map;

    }
    
    @Override
    public List<Vote> selectByUserId(String userId) {
        return voteDao.selectByUserId(userId);
    }
    
    
}
