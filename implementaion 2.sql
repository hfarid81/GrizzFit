-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gym`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gym` (
  `idGym` INT NOT NULL,
  `Gym Name` VARCHAR(45) NULL,
  `Gym Location` VARCHAR(45) NULL,
  `Members_Users_ID` INT NOT NULL,
  PRIMARY KEY (`idGym`, `Members_Users_ID`),
  INDEX `fk_Gym_Members1_idx` (`Members_Users_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Gym_Members1`
    FOREIGN KEY (`Members_Users_ID`)
    REFERENCES `mydb`.`Members` (`Users_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Personal Trainer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personal Trainer` (
  `idPersonal Trainer` INT NOT NULL,
  `FName` VARCHAR(45) NULL,
  `LName` VARCHAR(45) NULL,
  `Gym_idGym` INT NOT NULL,
  `Gym_Members_Users_ID` INT NOT NULL,
  PRIMARY KEY (`idPersonal Trainer`),
  INDEX `fk_Personal Trainer_Gym1_idx` (`Gym_idGym` ASC, `Gym_Members_Users_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Personal Trainer_Gym1`
    FOREIGN KEY (`Gym_idGym` , `Gym_Members_Users_ID`)
    REFERENCES `mydb`.`Gym` (`idGym` , `Members_Users_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Work Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Work Plan` (
  `Work_plan_ID` INT NOT NULL,
  `Beginner Full Body` VARCHAR(45) NULL,
  `Intermediate Workout` VARCHAR(45) NULL,
  `Advanced Workout` VARCHAR(45) NULL,
  PRIMARY KEY (`Work_plan_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Members`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Members` (
  `Users_ID` INT NULL,
  `Member_FName` VARCHAR(45) NULL,
  `Member_LName` VARCHAR(45) NULL,
  `Member_Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Zip` INT NULL,
  `Phone` BIGINT NULL,
  `Personal Trainer_idPersonal Trainer` INT NOT NULL,
  `Work Plan_Work_plan_ID` INT NOT NULL,
  PRIMARY KEY (`Users_ID`),
  INDEX `fk_Users_Personal Trainer_idx` (`Personal Trainer_idPersonal Trainer` ASC) VISIBLE,
  INDEX `fk_Users_Work Plan1_idx` (`Work Plan_Work_plan_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Users_Personal Trainer`
    FOREIGN KEY (`Personal Trainer_idPersonal Trainer`)
    REFERENCES `mydb`.`Personal Trainer` (`idPersonal Trainer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Users_Work Plan1`
    FOREIGN KEY (`Work Plan_Work_plan_ID`)
    REFERENCES `mydb`.`Work Plan` (`Work_plan_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Workout Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Workout Schedule` (
  `idWorkout Schedule` INT NOT NULL,
  `Legs` VARCHAR(45) NULL,
  `Chest` VARCHAR(45) NULL,
  `Back` VARCHAR(45) NULL,
  `Triceps` VARCHAR(45) NULL,
  `Shoulders` VARCHAR(45) NULL,
  `Calves` VARCHAR(45) NULL,
  `Abs` VARCHAR(45) NULL,
  `Number of Reps` VARCHAR(45) NULL,
  `Work Plan_Work_plan_ID` INT NOT NULL,
  `Personal Trainer_idPersonal Trainer` INT NOT NULL,
  PRIMARY KEY (`idWorkout Schedule`),
  INDEX `fk_Workout Schedule_Work Plan1_idx` (`Work Plan_Work_plan_ID` ASC) VISIBLE,
  INDEX `fk_Workout Schedule_Personal Trainer1_idx` (`Personal Trainer_idPersonal Trainer` ASC) VISIBLE,
  CONSTRAINT `fk_Workout Schedule_Work Plan1`
    FOREIGN KEY (`Work Plan_Work_plan_ID`)
    REFERENCES `mydb`.`Work Plan` (`Work_plan_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Workout Schedule_Personal Trainer1`
    FOREIGN KEY (`Personal Trainer_idPersonal Trainer`)
    REFERENCES `mydb`.`Personal Trainer` (`idPersonal Trainer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET FOREIGN_KEY_CHECKS = 0; 
/*
truncate `gym`;
truncate `Personal Trainer`;
truncate `Work Plan`;
truncate `Members`;
truncate `Workout Schedule`;
*/


INSERT IGNORE INTO `gym` VALUES (1, 'Planet Fitness', 'Rochester', 1);
INSERT IGNORE INTO `gym` VALUES (2, 'LA Fitness', 'Troy', 2);
INSERT IGNORE INTO `gym` VALUES (3, 'The Edge Fitness', 'Auburn Hills', 3);
select * from `gym`;

INSERT IGNORE INTO `Personal Trainer` VALUES (1, 'Enya', 'Beasley', 1, 1);
INSERT IGNORE INTO `Personal Trainer` VALUES (2, 'Mikey', 'Montoya', 2, 2);
INSERT IGNORE INTO `Personal Trainer` VALUES (3, 'Zachery', 'Mcneil', 3, 3);
select * from `Personal Trainer`;

INSERT IGNORE INTO `Work Plan` VALUES (1, 'Beginner 1', NULL, NULL);
INSERT  IGNORE INTO `Work Plan` VALUES (2, NULL, 'Intermediate 1', NULL);
INSERT  IGNORE INTO `Work Plan` VALUES (3, NULL, NULL, 'Advanced 1');
select * from `Work Plan`;

INSERT IGNORE INTO `Members` VALUES (1, 'Mia', 'Wolf', '23893 West Drive', 'Rochester', 'Michigan', 48085, 2486781234, 1, 1);
INSERT IGNORE INTO `Members` VALUES (2, 'Victoria', 'Villanueva', '07213 North Drive', 'Rochester', 'Michigan', 48085, 2483325133, 2, 2);
INSERT IGNORE INTO `Members` VALUES (3, 'Yousef', 'Gardner', '20101 East Drive', 'Troy', 'Michigan', 48084, 2486124732, 3, 3);
select * from `Members`;

INSERT IGNORE INTO `Workout Schedule` VALUES (1, 'Leg Press, Leg Extension, Barbell Squats', NULL, NULL, NULL, NULL, NULL, NULL, '2 sets 6 reps each', 1, 1);
INSERT IGNORE INTO `Workout Schedule` VALUES (2, Null, 'Cable Flys, Bench Press', 'Cable Rows', 'Bench Dips', NULL, NULL, NULL, '2 sets 6 reps each', 1, 1);
INSERT IGNORE INTO `Workout Schedule` VALUES (3, NULL, NULL, NULL, NULL, 'Lateral Raises, Overhead Press', 'Calf Raises', 'Reverse Crunches', '2 sets 6 reps each', 1, 1);
INSERT IGNORE INTO `Workout Schedule` VALUES (4, 'Leg Press, Leg Extension, Barbell Squats', NULL, NULL, NULL, NULL, NULL, NULL, '3 sets 8 reps each', 2, 2);
INSERT IGNORE INTO `Workout Schedule` VALUES (5, Null, 'Cable Flys, Bench Press', 'Cable Rows', 'Bench Dips', NULL, NULL, NULL, '3 sets 8 reps each', 2, 2);
INSERT IGNORE INTO `Workout Schedule` VALUES (6, NULL, NULL, NULL, NULL,'Lateral Raises, Overhead Press', 'Calf Raises', 'Reverse Crunches', '3 sets 8 reps each', 2, 2);
INSERT IGNORE INTO `Workout Schedule` VALUES (7, 'Leg Press, Leg Extension, Barbell Squats', NULL, NULL, NULL, NULL, NULL, NULL, '3 sets 10 reps each', 3, 3);
INSERT IGNORE INTO `Workout Schedule` VALUES (8, Null, 'Cable Flys, Bench Press', 'Cable Rows', 'Bench Dips', NULL, NULL, NULL, '3 sets 10 reps each', 3, 3);
INSERT IGNORE INTO `Workout Schedule` VALUES (9, NULL, NULL, NULL, NULL, 'Lateral Raises, Overhead Press', 'Calf Raises', 'Reverse Crunches', '3 sets 10 reps each', 3, 3);
select * from `Workout Schedule`;
