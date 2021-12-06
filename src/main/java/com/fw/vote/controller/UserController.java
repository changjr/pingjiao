package com.fw.vote.controller;

import com.fw.vote.model.Match;
import com.fw.vote.model.Player;
import com.fw.vote.model.User;
import com.fw.vote.service.MatchService;
import com.fw.vote.service.PlayerService;
import com.fw.vote.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller

@RequestMapping("user")
public class UserController {


    @Autowired
    UserService userService;

    @Autowired
    MatchService matchService;
    @RequestMapping("tomatch")
    public ModelAndView tomatch(Match match, ModelAndView mv, Player player){
//        通过matchcontroller那边的matchService执行一遍查询，拿到match
        List<Match> selectList = matchService.select(match);
        for (Match match1:selectList) {

            //获取总票数
            int countVote=  matchService.count(match1);

            match1.setVoteNumber(countVote);
        }
        mv.addObject("selectList",selectList);
        mv.setViewName("match");
        return mv;
    }


//    测试返回到登录页面
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

//    跳转到主页
    @RequestMapping("toindex")
    public ModelAndView toindex(Match match, ModelAndView mv, Player player){
//        通过matchcontroller那边的matchService执行一遍查询，拿到match
        List<Match> selectList = matchService.select(match);
        for (Match match1:selectList) {
            //获取总票数
          int countVote=  matchService.count(match1);

            match1.setVoteNumber(countVote);
        }
        mv.addObject("selectList",selectList);
        mv.setViewName("index");
        return mv;
    }

    @RequestMapping("/login")
    public String login(User user,HttpSession session,Model model){

        user =userService.login(user.getAccount(),user.getPassword());


        if(user != null){
            session.setAttribute("user",user);
            if(user.getScale().equals("0")){
                return "manageIndex";
            }else{
                return "index";
            }
        }
        model.addAttribute("msg","密码或用户出错");
        return "login";
    }

    @RequestMapping("/toRegist")
    public String toRegist(){
        return "regist";
    }

    @RequestMapping("/regist")
    public String regist(User user,Model model){
        System.out.print(user.getAccount()+" "+user.getPassword());
        userService.regist(user);
        model.addAttribute("msg","注册成功");
        return "login";
    }


    //注销方法
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "login";
    }

    @RequestMapping("/select")
    public ModelAndView select(User user,ModelAndView mv){
        int index=(user.getCurr()-1)*user.getPageSize();
        user.setIndex(index);
        user.setCount(userService.getCount(user));
        List<User> userList=userService.select(user);
        mv.setViewName("selectUser");
        mv.addObject("userList",userList);
        return mv;
    }

    @RequestMapping("save")
    public ModelAndView save(User user,ModelAndView mv,String userid){

        if (user.getUserid()!=null &&!user.getUserid().equals("")){
            User user1=  userService.selectById(userid);
            mv.addObject("user",user1);
            userService.update(user);
        }else {
            userService.insert(user);
        }
        /*return select(null,mv);*/
        return select(new User(),mv);
//        return "redirect:select";
    }

//    @RequestMapping("selectById")
//    public ModelAndView selectById(String userid,ModelAndView mv){
//        if(userid!=null&&!userid.equals("")){
//            User user=userService.selectById(userid);
//            mv.addObject("user",user);
//        }
//        mv.setViewName("addUser");
//        return mv;
//    }

    @RequestMapping("/addUser")
    public String addUser(){
        return "addUser1";
    }

    @RequestMapping("saveInsert")
    public ModelAndView saveInsert(User user,ModelAndView mv){
        System.out.print(user.getAccount()+" "+user.getPassword());
        userService.regist(user);
        /*return select(null,mv);*/
        return select(new User(),mv);
    }

    @RequestMapping("/update")
    public ModelAndView update(Integer userid,ModelAndView mv){
        User user = userService.selectById(userid);
        mv.addObject("user",user);
        mv.setViewName("updateUser1");
        return mv;
    }

    @RequestMapping("/updatesave")
    public ModelAndView updatesave(User user,ModelAndView mv){
        userService.update(user);
        return select(new User(),mv);
        /*return select(null, mv);*/
    }
    @RequestMapping("delete")
    public ModelAndView delete(ModelAndView mv,HttpServletRequest req){
        String[] deleteItems=req.getParameterValues("checkAll");
        for(int i=0;i<deleteItems.length;i++){
            userService.delete(Integer.parseInt(deleteItems[i]));
        }
        return select(null,mv);
    }
}
