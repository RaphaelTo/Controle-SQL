

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema film
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema film
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `film` DEFAULT CHARACTER SET utf8 ;
USE `film` ;
-- -----------------------------------------------------
-- Table `year`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `year` (
  `idyear` INT NOT NULL,
  `label` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idyear`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `module`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module` (
  `idmodule` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(225) NOT NULL,
  `year` INT NOT NULL,
  PRIMARY KEY (`idmodule`),
  INDEX `fk_module_year1_idx` (`year` ASC) ,
  CONSTRAINT `fk_module_year1`
    FOREIGN KEY (`year`)
    REFERENCES `year` (`idyear`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `student` (
  `idstudent` INT NOT NULL,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idstudent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assessment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assessment` (
  `idmodule` INT NOT NULL,
  `idstudent` INT NOT NULL,
  `attempted` DATETIME NOT NULL,
  `passed` DATETIME NULL,
  `grade` INT NULL,
  PRIMARY KEY (`idmodule`, `idstudent`, `attempted`),
  INDEX `fk_name_has_student_student1_idx` (`idstudent` ASC) ,
  INDEX `fk_name_has_student_name1_idx` (`idmodule` ASC) ,
  CONSTRAINT `fk_name_has_student_name1`
    FOREIGN KEY (`idmodule`)
    REFERENCES `module` (`idmodule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_name_has_student_student1`
    FOREIGN KEY (`idstudent`)
    REFERENCES `student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enrolment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enrolment` (
  `year_idyear` INT NOT NULL,
  `student_idstudent` INT NOT NULL,
  `from` DATETIME NOT NULL,
  `to` DATETIME NULL,
  PRIMARY KEY (`year_idyear`, `student_idstudent`),
  INDEX `fk_year_has_student_student1_idx` (`student_idstudent` ASC) ,
  INDEX `fk_year_has_student_year1_idx` (`year_idyear` ASC) ,
  CONSTRAINT `fk_year_has_student_year1`
    FOREIGN KEY (`year_idyear`)
    REFERENCES `year` (`idyear`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_year_has_student_student1`
    FOREIGN KEY (`student_idstudent`)
    REFERENCES `student` (`idstudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
