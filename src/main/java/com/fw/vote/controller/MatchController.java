package com.fw.vote.controller;

import com.fw.vote.model.Match;
import com.fw.vote.service.MatchService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@org.springframework.stereotype.Controller
@RequestMapping("match")
public class MatchController {

    @Resource
    MatchService matchService;

    @RequestMapping("toindex")
    public String toindex(){

        return "match";
    }



    @RequestMapping("toManageIndex")
    public String toManageIndex(){

        return "manageIndex";
    }
    @RequestMapping("list")
    public ModelAndView select(Match match, ModelAndView mv){
        List<Match> selectList = matchService.select(match);
        mv.setViewName("matchManage");
        mv.addObject("selectList",selectList);
        return mv;
    }


    @RequestMapping("insert")
    public String insert(Match match){
        matchService.insert(match);
        return "redirect:select";
    }

    @RequestMapping("form")
    public ModelAndView getmatch(String matchId,ModelAndView mv){
        if (matchId!=null){
        Match match = matchService.getMatchById(matchId);
            mv.addObject("match", match);
            mv.setViewName("matchdit");
            return mv;
        }
        else {
            mv.setViewName("matchdit");
            return mv;
        }
    }


    @RequestMapping("save")
    public ModelAndView inset(Match match, ModelAndView mv, MultipartFile upfile, HttpServletRequest req) throws IOException {

        if (upfile!=null&&upfile.getSize()>0){
            String filename=upfile.getOriginalFilename();
            String fileName=req.getServletContext().getRealPath("/")+"/static/upload/"+filename;
            File f=new File(fileName);
            if( !f.exists()){
                f.createNewFile();
            }
            upfile.transferTo(f);
            String path=req.getServletContext().getContextPath()+"/static/upload/"+filename;
            match.setMatchImage(path);
        }
//        下面判断有无值，选择更新或者插入
        if (match!=null&&match.getMatchId()!=null &&!match.getMatchId().equals("")){
            matchService.update(match);
        }
        else {
            matchService.insert(match);
        }
        return select(null,mv);
        //return "redirect:select"
    }
   @ResponseBody
    @RequestMapping("delete")
    public  Map<String,String> delete(String matchId){

//        用map传值
       Map<String,String> map=new HashMap<>();
//       抛出异常，让他在有删除的时候提示出来
        try {
            matchService.delete(matchId);
            map.put("msg","删除成功！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("msg","删除失败！");
        }

        return map;
    }
}
