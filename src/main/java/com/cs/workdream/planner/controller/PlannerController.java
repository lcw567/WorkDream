package com.cs.workdream.planner.controller;

import com.cs.workdream.planner.model.vo.Planner;
import com.cs.workdream.planner.service.PlannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/planner")
public class PlannerController {

    @Autowired
    private PlannerService plannerService;

    /**
     * 플래너 페이지 표시
     */
    @GetMapping("/planner")
    public String showPlanner() {
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
