package com.cd.exam.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cd.exam.models.Course;
import com.cd.exam.models.User;
import com.cd.exam.services.UserService;



@Controller
public class UserController {
	

	@Autowired
	private UserService userSer;
	
	
//	Registering codes stuff 
	@RequestMapping("/")
	public String index(@ModelAttribute("userObj")User user) {
		return "Index.jsp";
	}
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("userObj")User user, BindingResult results, HttpSession session) {
		if(results.hasErrors()) {
			return "Index.jsp";
		} 
		User newUser = userSer.registerUser(user);
        session.setAttribute("userId", newUser.getId());
		return "redirect:/dashboard";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute("userObj") User user,@RequestParam("email")String email, @RequestParam("password")String password, Model model, HttpSession session) {
		System.out.println("INSIDE THE LOGIN");
		if(!userSer.authenticateUser(email, password)) {
			model.addAttribute("error", "Invalid Credentials");
			return "Index.jsp";
		} 
		User u = userSer.findByEmail(email);
		System.out.println(u.getId());
		session.setAttribute("userId", u.getId());
		return "redirect:/dashboard";
	}
    @RequestMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
    	Long userId = (Long) session.getAttribute("userId");
    	User u = userSer.findUserById(userId);
    	List<Course> allCourse = userSer.getAllCourse();
    	model.addAttribute("allCourse", allCourse);
    	model.addAttribute("user", u );
    	return "Dashboard.jsp";
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
    
//   -----------------new course ---------------------
    @GetMapping("/courses/new")
    public String newClass(@ModelAttribute("classObj") Course course) {
    	return "createClass.jsp";
    }
    @PostMapping("/courses/new")
    public String createClass(@Valid @ModelAttribute("classObj") Course course, BindingResult results) {
    	if(results.hasErrors()) {
    		return "createClass.jsp";
    	}
    	userSer.createCourse(course);
    	return "redirect:/dashboard";
    }
//  -----------editing a course ------------------
    @GetMapping("/course/{id}/edit")
    public String editCourse(@PathVariable("id") Long id, Model model) {
    	model.addAttribute("classObj", userSer.findCourse(id));
    	return "editCourse.jsp";
    }
    @PutMapping("/course/{id}/edit")
    public String updateCourse(@Valid @ModelAttribute("classObj") Course course, BindingResult results,@PathVariable("id") Long id) {
    	if(results.hasErrors()) {
    		return "editCourse.jsp";
    	}
    	else {
    		userSer.updateCourse(course);
    		return "redirect:/course/"+ id ;
    	}
    }
//    --------------show course --------------------
    @GetMapping("/course/{id}")
    public String viewCourse(@PathVariable("id") Long id, Model model) {
    	Course course = userSer.findCourse(id);
    	model.addAttribute("course", course);
    	return "ShowCourse.jsp";
    			
    }
//  -------------delete from dashboard------------------------
    @RequestMapping(value="/course/{id}", method=RequestMethod.DELETE)
    public String delCourse (@PathVariable("id")Long id) {
    	userSer.deleteCourse(id);
    	return "redirect:/dashboard";
    }
    
//  ----------Remove from course-------------------
    @PostMapping("/user/{id}")
    public String removeUserToCourse (@PathVariable("id")long userId, @RequestParam("course")Long courseId) {
    	User user = userSer.findUser(userId);
    	Course course = userSer.findCourse(courseId);
    	course.getUser().remove(user);
    	userSer.createCourse(course);
    	return "redirect:/course/" + courseId;
    }
    
//  ----------adding to the course -----------------
    @PostMapping("/course/{id}")
    public String addUserToCourse (@PathVariable("id")long courseId, @RequestParam("user")Long userId) {
    	User user = userSer.findUser(userId);
    	Course course = userSer.findCourse(courseId);
    	course.getUser().add(user);
    	userSer.createCourse(course);
    	return "redirect:/course/" + courseId;
    }

}