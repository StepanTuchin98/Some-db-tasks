USE Atelier
INSERT INTO [dbo].[Client]
([Surname], [Name], [Patronymic], [Phone])
 VALUES
('������', '���������', '����������', '89243541496'),
('������', '������', '���������', '89245581496'),
('�������', '����', '���������', '89245581496');

INSERT INTO [dbo].[Client_Size_Boots]
([IDClient], [Size])
 VALUES
('1', '42'),
('2', '39')

INSERT INTO [dbo].[Client_Size_Clothes]
([IDClient], [Size])
values
('1', 'M'),
('2','XL')

INSERT INTO [dbo].[Worker]
(Surname, Name, [Patronic], [Phone], [Salary], [License], [INN])
values
('������', '����', '��������', '89472226655', '15000', '45698213654', '159753684265'),
('������', 'ϸ��', '��������', '89465263214', '20000', '56974516597', '154786523215'),
('�������', '�������', '����������', '89264586547', '17000', '1111111111', '222222222222'),
('����������', '����', '���������', '89175455644', '19000', '52698745152', '465231987454'),
('����������', '����', '����������', '89602545566', '18000', '41253698745', '562148932545'),
('�������', '�����', '��������', '87855556985', '14000', '58964235874', '453215896541');

INSERT INTO [dbo].[Material]
([Name])
values
('ظ��'),
('������'),
('����'),
('��������')

INSERT [dbo].[Provider]
([CompanyName], [Phone])
values
('����� ��', '446445'),
('�����������', '555555'),
('������-�����', '555323'),
('������� ��� ������', NULL)

INSERT [dbo].[Material_Provider]
([IDMaterial], [IDProvider], [Cost])
values
('1', '1','200'),
('2', '2','1500'),
('3', '3','2020'),
('1', '3','400'),
('2', '2','1900'),
('3', '1','1320')

INSERT [dbo].[Model]
([Name], [Cost])
values
('�����', '1000'),
('������', '15000'),
('�����', '9000')

INSERT [dbo].[Model_Material_Quantity]
([IDMaterial], [IDModel], [Quantity])
values
('1', '1', '3'),
('2', '1', '5'),
('3', '1', '2'),
('1', '2', '2'),
('2', '2', '3'),
('3', '2', '1'),
('1', '3', '5'),
('2', '3', '2'),
('3', '3', '1')

INSERT [dbo].[MaterialOrder]
([IDModel_Material_Quantity], [IDMaterial_Provider], [StartDate], [EndDate])
values
('1', '1', '2018-03-03', '2018-08-03'),
('2', '2', '2018-05-03', '2018-08-03'),
('3', '3', '2018-05-03', '2018-08-03')

INSERT [dbo].[Work]
([IDMaterialOrder], [IDWorker], [Term])
values
('1', '1', '2018-12-25'),
('2', '2', '2018-11-25'),
('3', '3', '2018-10-25')

INSERT [dbo].[Work]
([IDMaterialOrder], [Term])
values
('1', '2018-10-25')


INSERT [dbo].[Order]
([IDClient], [IDSizeBoots], [IDSizeClothes], [IDWork], [Cost], [StartDate], [EndDate])
values
('1', '1', '1', '1', '12000', cast(getdate() as date), '2020-03-09'),
('1', '1', '1', '2', '1250', '2017-11-22', '2018-02-01'),
('2', '2', '2', '2', '1210', '2017-10-05', '2018-01-27')

INSERT [dbo].[Comment]
([IDClient], [IDOrder], [IDWorker], [Comment])
values
('1', '1', '1', 'GOOD')

