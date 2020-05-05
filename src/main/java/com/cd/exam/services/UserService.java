package com.cd.exam.services;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cd.exam.models.Course;
import com.cd.exam.models.User;
import com.cd.exam.repositories.CourseRepository;
import com.cd.exam.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired 
	private UserRepository userRepo;
	
	@Autowired
	private CourseRepository courRepo;
	
	public User registerUser(User user) {
	        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
	        user.setPassword(hashed);
	        return userRepo.save(user);
	}
	    
    // find user by email
    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepo.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepo.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

	public void createCourse(@Valid Course course) {
		courRepo.save(course);
		
	}

	public List<Course> getAllCourse() {
		return courRepo.findAll();
	}

	public Course findCourse(Long id) {
		Course course = courRepo.findById(id).orElse(null);
		return course;
	}


	public void createUser(@Valid User user) {
		userRepo.save(user);
		
	}

	public User findUser(Long userId) {
		User user = userRepo.findById(userId).orElse(null);
		if(user == null) {
			return null;
		}
		return user;
	}
	public void deleteCourse(Long Id) {
		courRepo.deleteById(Id);
	}

		
	public void updateCourse(@Valid Course course) {
		courRepo.save(course);
		
	}
}