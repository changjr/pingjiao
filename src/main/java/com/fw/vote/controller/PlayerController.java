package com.fw.vote.controller;

import com.fw.vote.model.Player;
import com.fw.vote.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Null;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("player")
public class PlayerController {

    @Autowired
    PlayerService playerService;

    @RequestMapping("select")
    public ModelAndView select(Player player,ModelAndView mv){
      int index=(player.getCurr()-1)*player.getPageSize();
      player.setIndex(index);
      player.setCount(playerService.getCount(player));
        List<Player> playerList= playerService.select(player);
        mv.setViewName("player");
        mv.addObject("playerList",playerList);
        return mv;
    }

    @RequestMapping("save")
    public ModelAndView add(Player player, ModelAndView mv, MultipartFile upfile, HttpServletRequest req) throws IllegalStateException, IOException {
            if (upfile!=null&&upfile.getSize()>0){
                String filename=upfile.getOriginalFilename();
                String fileName=req.getServletContext().getRealPath("/")+"/static/upload/"+filename;
                File f=new File(fileName);
                if( !f.exists()){
                    f.createNewFile();
                }
                upfile.transferTo(f);
                String path=req.getServletContext().getContextPath()+"/static/upload/"+filename;
                player.setPlayerImage(path);
            }
           /* if (player.getPlayerId()!=null&&!player.getPlayerId().equals("")){
                playerService.update(player);
            }else {
                playerService.insert(player);
            }*/
        if (player.getPlayerId()!=null&&!player.getPlayerId().equals("")){
            playerService.update(player);
        }else {
            playerService.insert(player);
        }
          /* return select(null,mv);*/
        return select(new Player(),mv);

    }


    @RequestMapping("selectById")
    public ModelAndView selectById(String playerId,ModelAndView mv){
        if(playerId!=null&&!playerId.equals("")){
            Player player=playerService.selectById(playerId);
            mv.addObject("player",player);
        }
        mv.setViewName("playeredit");
        return mv;
    }
    @ResponseBody
    @RequestMapping("delete")
    public Map<String,String>delete(String playerId){
        //用map传值
        Map<String,String> map=new HashMap<>();
        //抛出异常，删除时提示
        try {
            playerService.delete(playerId);
            map.put("msg","删除成功！");
        }catch (Exception e){
            e.printStackTrace();
            map.put("msg","删除失败！");
        }
        return map;
    }
}
