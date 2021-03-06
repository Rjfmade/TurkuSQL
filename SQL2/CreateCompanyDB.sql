-- MySQL Script generated by MySQL Workbench
-- Wed Jul 14 18:06:19 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema SQL_II_assigment_Jose_Faustino
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SQL_II_assigment_Jose_Faustino
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SQL_II_assigment_Jose_Faustino` DEFAULT CHARACTER SET utf8mb4 ;
USE `SQL_II_assigment_Jose_Faustino` ;

-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Type_Of_Business`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Type_Of_Business` (
  `idType_Of_Business` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idType_Of_Business`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Customer_Adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Customer_Adress` (
  `idCustomer_Adress` INT NOT NULL,
  `Street` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZIPcode` INT NULL,
  PRIMARY KEY (`idCustomer_Adress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Customer` (
  `idCustomer` INT NOT NULL,
  `ContactTittle` VARCHAR(45) NULL,
  `ContactName` VARCHAR(45) NULL,
  `CompanyName` VARCHAR(45) NULL,
  `numberOfEmployees` INT NULL,
  `Type_Of_Business_idType_Of_Business` INT NOT NULL,
  `Customer_Adress_copy1_idCustomer_Adress` INT NOT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `fk_Customer_Type_Of_Business1_idx` (`Type_Of_Business_idType_Of_Business` ASC),
  INDEX `fk_Customer_Customer_Adress_copy11_idx` (`Customer_Adress_copy1_idCustomer_Adress` ASC),
  CONSTRAINT `fk_Customer_Type_Of_Business1`
    FOREIGN KEY (`Type_Of_Business_idType_Of_Business`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Type_Of_Business` (`idType_Of_Business`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_Customer_Adress_copy11`
    FOREIGN KEY (`Customer_Adress_copy1_idCustomer_Adress`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Customer_Adress` (`idCustomer_Adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Consultant_Adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Consultant_Adress` (
  `idConsultant_Adress` INT NOT NULL,
  `Street` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZIPcode` INT NULL,
  PRIMARY KEY (`idConsultant_Adress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Consultant_Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Consultant_Role` (
  `idConsultant_Role` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConsultant_Role`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Consultant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Consultant` (
  `idConsultant` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `PhoneNumber 1` VARCHAR(45) NULL,
  `PhoneNumber2` VARCHAR(45) NULL,
  `DateofBirth` DATE NULL,
  `Years in the company` FLOAT NULL,
  `Consultant_Adress_idConsultant_Adress` INT NOT NULL,
  `Consultant_Role_idConsultant_Role` INT NOT NULL,
  PRIMARY KEY (`idConsultant`),
  INDEX `fk_Consultant_Consultant_Adress_idx` (`Consultant_Adress_idConsultant_Adress` ASC),
  INDEX `fk_Consultant_Consultant_Role1_idx` (`Consultant_Role_idConsultant_Role` ASC),
  CONSTRAINT `fk_Consultant_Consultant_Adress`
    FOREIGN KEY (`Consultant_Adress_idConsultant_Adress`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Consultant_Adress` (`idConsultant_Adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_Consultant_Role1`
    FOREIGN KEY (`Consultant_Role_idConsultant_Role`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Consultant_Role` (`idConsultant_Role`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Technical Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Technical Skill` (
  `idTechnical Skills` INT NOT NULL,
  `Name_Skill` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTechnical Skills`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Degree Recieved`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Degree Recieved` (
  `idDegree Recieved` INT NOT NULL,
  `Name_Degree` VARCHAR(45) NULL,
  PRIMARY KEY (`idDegree Recieved`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Consultant_to_Skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Consultant_to_Skill` (
  `Technical Skill_idTechnical Skills` INT NULL,
  `Consultant_idConsultant` INT NULL,
  PRIMARY KEY (`Technical Skill_idTechnical Skills`, `Consultant_idConsultant`),
  INDEX `fk_Consultant_to_Skill_Consultant1_idx` (`Consultant_idConsultant` ASC),
  CONSTRAINT `fk_Consultant_to_Skill_Technical Skill1`
    FOREIGN KEY (`Technical Skill_idTechnical Skills`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Technical Skill` (`idTechnical Skills`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_to_Skill_Consultant1`
    FOREIGN KEY (`Consultant_idConsultant`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Consultant` (`idConsultant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Consultant_to_Degree`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Consultant_to_Degree` (
  `Degree Recieved_idDegree Recieved` INT NULL,
  `Consultant_idConsultant` INT NULL,
  PRIMARY KEY (`Degree Recieved_idDegree Recieved`, `Consultant_idConsultant`),
  INDEX `fk_Consultant_to_Degree_Consultant1_idx` (`Consultant_idConsultant` ASC),
  CONSTRAINT `fk_Consultant_to_Degree_Degree Recieved1`
    FOREIGN KEY (`Degree Recieved_idDegree Recieved`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Degree Recieved` (`idDegree Recieved`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_to_Degree_Consultant1`
    FOREIGN KEY (`Consultant_idConsultant`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Consultant` (`idConsultant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Project Proposal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Project Proposal` (
  `idProject Proposal` INT NOT NULL,
  `Propositon_date` TIMESTAMP NULL,
  `Estimated_Duration(days)` INT NULL,
  `Decision_Date` TIMESTAMP NULL,
  `Estimated_Cost` VARCHAR(45) NULL,
  `Customer_idCustomer` INT NOT NULL,
  `Status_Selecction` BIT NOT NULL,
  PRIMARY KEY (`idProject Proposal`),
  INDEX `fk_Project Proposal_Customer1_idx` (`Customer_idCustomer` ASC),
  CONSTRAINT `fk_Project Proposal_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Services` (
  `idServices` INT NOT NULL,
  `Description` VARCHAR(45) NULL,
  `Cost` VARCHAR(45) NULL,
  PRIMARY KEY (`idServices`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Consultant_has_Project Proposal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Consultant_has_Project Proposal` (
  `Consultant_idConsultant` INT NULL,
  `Project Proposal_idProject Proposal` INT NOT NULL,
  PRIMARY KEY (`Consultant_idConsultant`, `Project Proposal_idProject Proposal`),
  INDEX `fk_Consultant_has_Project Proposal_Project Proposal1_idx` (`Project Proposal_idProject Proposal` ASC),
  INDEX `fk_Consultant_has_Project Proposal_Consultant1_idx` (`Consultant_idConsultant` ASC),
  CONSTRAINT `fk_Consultant_has_Project Proposal_Consultant1`
    FOREIGN KEY (`Consultant_idConsultant`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Consultant` (`idConsultant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_has_Project Proposal_Project Proposal1`
    FOREIGN KEY (`Project Proposal_idProject Proposal`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Project Proposal` (`idProject Proposal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Location_Adress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Location_Adress` (
  `idLocation_Adress` INT NOT NULL,
  `Street` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZIPcode` INT NULL,
  PRIMARY KEY (`idLocation_Adress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Location` (
  `idLocation` INT NOT NULL,
  `Phone` VARCHAR(45) NULL,
  `Building size` VARCHAR(45) NULL,
  `Location_Adress_copy1_copy1_idLocation_Adress` INT NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idLocation`, `Customer_idCustomer`),
  INDEX `fk_Location_Location_Adress_copy1_copy11_idx` (`Location_Adress_copy1_copy1_idLocation_Adress` ASC),
  INDEX `fk_Location_Customer1_idx` (`Customer_idCustomer` ASC),
  CONSTRAINT `fk_Location_Location_Adress_copy1_copy11`
    FOREIGN KEY (`Location_Adress_copy1_copy1_idLocation_Adress`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Location_Adress` (`idLocation_Adress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Location_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Consultant_has_Services_Per_Project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Consultant_has_Services_Per_Project` (
  `Consultant_idConsultant` INT NULL,
  `Services_idServices` INT NULL,
  `Project Proposal_idProject Proposal` INT NOT NULL,
  PRIMARY KEY (`Project Proposal_idProject Proposal`),
  INDEX `fk_Consultant_has_Services_Services1_idx` (`Services_idServices` ASC),
  INDEX `fk_Consultant_has_Services_Consultant1_idx` (`Consultant_idConsultant` ASC),
  INDEX `fk_Consultant_has_Services_Project Proposal1_idx` (`Project Proposal_idProject Proposal` ASC),
  CONSTRAINT `fk_Consultant_has_Services_Consultant1`
    FOREIGN KEY (`Consultant_idConsultant`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Consultant` (`idConsultant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_has_Services_Services1`
    FOREIGN KEY (`Services_idServices`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Services` (`idServices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultant_has_Services_Project Proposal1`
    FOREIGN KEY (`Project Proposal_idProject Proposal`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Project Proposal` (`idProject Proposal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Services Offered`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Services Offered` (
  `idServices Offered` INT NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  `Location_idLocation` INT NOT NULL,
  `Consultant_has_Services_Per_Project_Project Proposal_idProject Proposal` INT NOT NULL,
  PRIMARY KEY (`idServices Offered`),
  INDEX `fk_Services Offered_Customer1_idx` (`Customer_idCustomer` ASC),
  INDEX `fk_Services Offered_Location1_idx` (`Location_idLocation` ASC),
  INDEX `fk_Services Offered_Consultant_has_Services_Per_Project1_idx` (`Consultant_has_Services_Per_Project_Project Proposal_idProject Proposal` ASC),
  CONSTRAINT `fk_Services Offered_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Services Offered_Location1`
    FOREIGN KEY (`Location_idLocation`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Location` (`idLocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Services Offered_Consultant_has_Services_Per_Project1`
    FOREIGN KEY (`Consultant_has_Services_Per_Project_Project Proposal_idProject Proposal`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Consultant_has_Services_Per_Project` (`Project Proposal_idProject Proposal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Service Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Service Log` (
  `Effective_Cost` INT NULL,
  `Effective_Duration` INT NULL,
  `Delivered` BIT NOT NULL,
  `Customer_Satisfaction` VARCHAR(45) NULL,
  `Date_Started` TIMESTAMP NULL,
  `Date_Finshed` TIMESTAMP NULL,
  `Services Offered_idServices Offered` INT NOT NULL,
  PRIMARY KEY (`Services Offered_idServices Offered`),
  INDEX `fk_Service Log_Services Offered1_idx` (`Services Offered_idServices Offered` ASC),
  CONSTRAINT `fk_Service Log_Services Offered1`
    FOREIGN KEY (`Services Offered_idServices Offered`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Services Offered` (`idServices Offered`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Project Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Project Log` (
  `Date_Finished` TIMESTAMP NULL,
  `Effective_Cost` INT NULL,
  `Overall_Customer_Satisfaction` VARCHAR(45) NULL,
  `Project Proposal_idProject Proposal` INT NOT NULL,
  `Service Log_Services Offered_idServices Offered1` INT NOT NULL,
  `Status_Production` BIT NOT NULL,
  `Status_Done` BIT NOT NULL,
  `Date_Started` TIMESTAMP NULL,
  PRIMARY KEY (`Project Proposal_idProject Proposal`),
  INDEX `fk_Project Log_Project Proposal1_idx` (`Project Proposal_idProject Proposal` ASC),
  INDEX `fk_Project Log_Service Log1_idx` (`Service Log_Services Offered_idServices Offered1` ASC),
  CONSTRAINT `fk_Project Log_Project Proposal1`
    FOREIGN KEY (`Project Proposal_idProject Proposal`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Project Proposal` (`idProject Proposal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Project Log_Service Log1`
    FOREIGN KEY (`Service Log_Services Offered_idServices Offered1`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Service Log` (`Services Offered_idServices Offered`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Project Proposal_has_Services`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Project Proposal_has_Services` (
  `Project Proposal_idProject Proposal` INT NOT NULL,
  `Services_idServices` INT NOT NULL,
  `Status` BIT NULL,
  `Project Log_Project Proposal_idProject Proposal` INT NULL,
  PRIMARY KEY (`Project Proposal_idProject Proposal`, `Services_idServices`),
  INDEX `fk_Project Proposal_has_Services_Services1_idx` (`Services_idServices` ASC),
  INDEX `fk_Project Proposal_has_Services_Project Proposal1_idx` (`Project Proposal_idProject Proposal` ASC),
  INDEX `fk_Project Proposal_has_Services_Project Log1_idx` (`Project Log_Project Proposal_idProject Proposal` ASC),
  CONSTRAINT `fk_Project Proposal_has_Services_Project Proposal1`
    FOREIGN KEY (`Project Proposal_idProject Proposal`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Project Proposal` (`idProject Proposal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Project Proposal_has_Services_Services1`
    FOREIGN KEY (`Services_idServices`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Services` (`idServices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Project Proposal_has_Services_Project Log1`
    FOREIGN KEY (`Project Log_Project Proposal_idProject Proposal`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Project Log` (`Project Proposal_idProject Proposal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Customer Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Customer Log` (
  `Customer_idCustomer` INT NOT NULL,
  `lastContact` TIMESTAMP NULL,
  `firstContact` TIMESTAMP NULL,
  `preferedChannel` VARCHAR(45) NULL,
  PRIMARY KEY (`Customer_idCustomer`),
  CONSTRAINT `fk_Customer Log_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Channels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Channels` (
  `idChannels` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idChannels`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Customer Log_has_Channels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Customer Log_has_Channels` (
  `Customer Log_Customer_idCustomer` INT NULL,
  `Channels_idChannels` INT NULL,
  PRIMARY KEY (`Customer Log_Customer_idCustomer`, `Channels_idChannels`),
  INDEX `fk_Customer Log_has_Channels_Channels1_idx` (`Channels_idChannels` ASC),
  INDEX `fk_Customer Log_has_Channels_Customer Log1_idx` (`Customer Log_Customer_idCustomer` ASC),
  CONSTRAINT `fk_Customer Log_has_Channels_Customer Log1`
    FOREIGN KEY (`Customer Log_Customer_idCustomer`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Customer Log` (`Customer_idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer Log_has_Channels_Channels1`
    FOREIGN KEY (`Channels_idChannels`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Channels` (`idChannels`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SQL_II_assigment_Jose_Faustino`.`Type_Of_Business_has_Consultant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SQL_II_assigment_Jose_Faustino`.`Type_Of_Business_has_Consultant` (
  `Type_Of_Business_idType_Of_Business` INT NULL,
  `Consultant_idConsultant` INT NULL,
  PRIMARY KEY (`Type_Of_Business_idType_Of_Business`, `Consultant_idConsultant`),
  INDEX `fk_Type_Of_Business_has_Consultant_Consultant1_idx` (`Consultant_idConsultant` ASC),
  INDEX `fk_Type_Of_Business_has_Consultant_Type_Of_Business1_idx` (`Type_Of_Business_idType_Of_Business` ASC),
  CONSTRAINT `fk_Type_Of_Business_has_Consultant_Type_Of_Business1`
    FOREIGN KEY (`Type_Of_Business_idType_Of_Business`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Type_Of_Business` (`idType_Of_Business`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Type_Of_Business_has_Consultant_Consultant1`
    FOREIGN KEY (`Consultant_idConsultant`)
    REFERENCES `SQL_II_assigment_Jose_Faustino`.`Consultant` (`idConsultant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
