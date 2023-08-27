part of 'signup_cubit.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class ChangeRadioButtonSucessState extends SignupState {}

class ChangePasswordVisibilityState extends SignupState {}

class IDNumberImagePickedSucessState extends SignupState {}

class IDNumberImagePickedErrorState extends SignupState {}

class ChangeCurrentStepIndexState extends SignupState {}

class RadiologyImagePickedSucessState extends SignupState {}

class RadiologyImagePickedErrorState extends SignupState {}

class LoadingNationalityValuesState extends SignupState {}

class GetNationalityValuesSucessState extends SignupState {}

class GetIdTypeValuesSucessState extends SignupState {}

class ReligionLoadedState extends SignupState {}

class GetMaritalStatusValuesSucessState extends SignupState {}

class LoadingMaritalValuesState extends SignupState {}

class GetInsuranceNamesValuesSucessState extends SignupState {}

class GetGenderValuesSucessState extends SignupState {}

class GetInsuranceCompanyValuesSucessState extends SignupState {}

class LoadingInsuranceValuesState extends SignupState {}

class GetInsuranceTypeValuesSucessState extends SignupState {}

class GetInsuranceLevelValuesSucessState extends SignupState {}

class GetHeigthUnitValuesSucessState extends SignupState {}

class GetWeigthUnitValuesSucessState extends SignupState {}

class GetBloodTypeValuesSucessState extends SignupState {}

class GetDiseasesValuesSucessState extends SignupState {}

class GetAllergiesValuesSucessState extends SignupState {}

class GetMedicationValuesSucessState extends SignupState {}

class GetOperationsValuesSucessState extends SignupState {}

class GetRadiologyValuesSucessState extends SignupState {}

class GetRadiologyAreaValuesSucessState extends SignupState {}

class GetToClinicValuesSucessState extends SignupState {}

class AddNewRadiologyCollectionState extends SignupState {}

class AddNewLabCollectionState extends SignupState {}

class ChangeVisibilityOfPassportNumberState extends SignupState {}

class GetSmokingValuesSucessState extends SignupState {}

class ChangeCurrentDateTypeState extends SignupState {}

class LabImagePickedSucessState extends SignupState {}

class LabImagePickedErrorState extends SignupState {}

class PrescriptoinImagePickedSucessState extends SignupState {}

class PrescriptoinImagePickedErrorState extends SignupState {}

class AddNewPrescriptionCollectionState extends SignupState {}
