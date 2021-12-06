package com.fw.vote.controller;

import com.fw.vote.model.Vote;
import com.fw.vote.service.VoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("vote")
public class VoteController {
    @Autowired
    private VoteService voteService;
    @ResponseBody
    @RequestMapping("vote")
    public Map<String,Object> vote(Vote vote, HttpSession session,String flag){
       return voteService.save(vote,session,flag);
    }

}
