package com.cs.workdream.planner.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cs.workdream.planner.model.vo.Planner;
import com.cs.workdream.planner.service.PlannerService;

@Controller
@RequestMapping("/planner")
public class PlannerController {

    @Autowired
    private PlannerService plannerService;

    /**
     * 플래너 페이지 표시
     */

    
    @GetMapping("/planner")
    public String showPlannerOld(HttpSession session) {
        Object loginUser = session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        return "planner/planner"; 
    }

    /**
     * REST API: 이벤트 조회
     * GET /planner/api/events?userNo=...
     */
    @GetMapping("/api/events")
    @ResponseBody
    public ResponseEntity<List<Planner>> getEvents(@RequestParam Long userNo) {
        List<Planner> events = plannerService.getPlannersByUserNo(userNo);
        return ResponseEntity.ok(events);
    }

    /**
     * REST API: 이벤트 추가
     * POST /planner/api/events
     */
    @PostMapping("/api/events")
    @ResponseBody
    public ResponseEntity<Planner> addEvent(@RequestBody Planner planner) {
        plannerService.addPlanner(planner);
        return ResponseEntity.ok(planner);
    }

    /**
     * REST API: 이벤트 업데이트
     * PUT /planner/api/events/{eventId}
     */
    @PutMapping("/api/events/{eventId}")
    @ResponseBody
    public ResponseEntity<Planner> updateEvent(@PathVariable Long eventId, @RequestBody Planner planner) {
        planner.setEventId(eventId);
        plannerService.updatePlanner(planner);
        Planner updatedPlanner = plannerService.getPlannerById(eventId);
        return ResponseEntity.ok(updatedPlanner);
    }

    /**
     * REST API: 이벤트 삭제 (소프트 삭제)
     * DELETE /planner/api/events/{eventId}
     */
    @DeleteMapping("/api/events/{eventId}")
    @ResponseBody
    public ResponseEntity<Void> deleteEvent(@PathVariable Long eventId) {
        plannerService.deletePlanner(eventId);
        return ResponseEntity.ok().build();
    }
}
