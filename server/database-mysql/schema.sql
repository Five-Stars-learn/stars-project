-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`teacher` (
  `idteacher` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `department` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idteacher`),
  UNIQUE INDEX `idteacher_UNIQUE` (`idteacher` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`courses` (
  `idcourses` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `teacher_idteacher` INT NOT NULL,
  PRIMARY KEY (`idcourses`),
  UNIQUE INDEX `idcourses_UNIQUE` (`idcourses` ASC) VISIBLE,
  INDEX `fk_courses_teacher1_idx` (`teacher_idteacher` ASC) VISIBLE,
  CONSTRAINT `fk_courses_teacher1`
    FOREIGN KEY (`teacher_idteacher`)
    REFERENCES `school`.`teacher` (`idteacher`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`student` (
  `idstudent` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idstudent`),
  UNIQUE INDEX `idstudent_UNIQUE` (`idstudent` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`courses_has_student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`courses_has_student` (
  `courses_idcourses` INT NOT NULL,
  `student_idstudent` INT NOT NULL,
  PRIMARY KEY (`courses_idcourses`, `student_idstudent`),
  INDEX `fk_courses_has_student_student1_idx` (`student_idstudent` ASC) VISIBLE,
  INDEX `fk_courses_has_student_courses1_idx` (`courses_idcourses` ASC) VISIBLE,
  CONSTRAINT `fk_courses_has_student_courses1`
    FOREIGN KEY (`courses_idcourses`)
    REFERENCES `school`.`courses` (`idcourses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_has_student_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `school`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `school`.`student_has_teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`student_has_teacher` (
  `student_idstudent` INT NOT NULL,
  `teacher_idteacher` INT NOT NULL,
  PRIMARY KEY (`student_idstudent`, `teacher_idteacher`),
  INDEX `fk_student_has_teacher_teacher1_idx` (`teacher_idteacher` ASC) VISIBLE,
  INDEX `fk_student_has_teacher_student1_idx` (`student_idstudent` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_teacher_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `school`.`student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_teacher_teacher1`
    FOREIGN KEY (`teacher_idteacher`)
    REFERENCES `school`.`teacher` (`idteacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
