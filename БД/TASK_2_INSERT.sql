USE Atelier
INSERT INTO [dbo].[Client]
([Surname], [Name], [Patronymic], [Phone])
 VALUES
('������', '���������', '����������', '89243541496'),
('������', '������', '���������', '89245581496'),
('�������', '����', '���������', '89245581496'),
('������', '����', '����������', '89243441496'),
('������', '�����', '�������������', '89245581496'),
('�������', '����', '����������', '89245581464'),
('������', '����', '�������������', '89222441496'),
('������', '����', '���������', '89245585226'),
('������', '����', '���������', '89245581453'),
('��������', '�����', '����������', '89543541496'),
('�����', '������', '�������������', '89245581596'),
('������', '����', '���������', '89245581466'),
('������', '���������', '����������', '89243541496'),
('������', '�����', '�������������', '89245511496'),
('�������', '����', '�������', '89245586496'),
('�������', '����', '�������', '89243541496'),
('�������', '������', '���������', '89245681496'),
('�������', '����', '�������', '89245583496'),
('������', '���������', '�������', '89643541496'),
('������', '�������', '���������', '89245521496'),
('�������', '����', '�����������', '89245586496'),
('������', '������', '����������', '89543541496'),
('�����', '������', '�������������', '89245583496'),
('�������', '����', '�������', '89245585496'),
('�����', '���������', '���������', '89243541496'),
('�������', '������', '��������', '89245181496'),
('������', '����', '��������', '89245581596'),
('�������', '���������', '����������', '86243541496'),
('������', '�����', '���������', '89245531496'),
('��������', '����', '���������', '89245531496'),
('������', '�����', '��������', '89643541496'),
('�������', '����', '���������', '89245581496'),
('�����', '�����', '����������', '89245581456'),
('�����', '�����', '����������', '89253541496'),
('�����', '����', '����������', '89245585496'),
('������', '�����', '���������', '89245581396');

INSERT INTO [dbo].[Client_Size_Boots]
([IDClient], [Size])
 VALUES
('1', '42'),
('2', '39'),
('3', '42'),
('4', '39'),
('5', '42'),
('6', '31'),
('7', '46'),
('8', '31'),
('9', '41'),
('10', '37'),
('11', '44'),
('12', '36'),
('13', '44'),
('14', '32'),
('15', '41'),
('16', '45'),
('17', '31'),
('18', '44'),
('19', '45'),
('20', '33'),
('21', '42'),
('22', '32'),
('23', '52'),
('24', '39'),
('25', '52'),
('26', '44'),
('27', '31'),
('28', '43'),
('29', '35'),
('30', '32'),
('31', '35'),
('32', '36'),
('33', '31'),
('34', '35'),
('35', '31'),
('36', '39');


INSERT INTO [dbo].[Client_Size_Clothes]
([IDClient], [Size])
values
('1', 'M'),
('2','XL'),
('3', 'M'),
('4', 'M'),
('5', 'M'),
('6', 'M'),
('7', 'M'),
('8', 'L'),
('9', 'L'),
('10', 'L'),
('11', 'L'),
('12', 'L'),
('13', 'L'),
('14', 'L'),
('15', 'M'),
('16', 'X'),
('17', 'M'),
('18', 'L'),
('19', 'x'),
('20', 'X'),
('21', 'S'),
('22', 'S'),
('23', 'S'),
('24', 'S'),
('25', 'S'),
('26', 'S'),
('27', 'S'),
('28', 'M'),
('29', 'L'),
('30', 'M'),
('31', 'L'),
('32', 'S'),
('33', 'S'),
('34', 'S'),
('35', 'S'),
('36', 'S');

INSERT INTO [dbo].[Worker]
(Surname, Name, [Patronic], [Phone], [Salary], [License], [INN])
values
('������', '����', '��������', '89472226655', '15000', '45698213654', '159753684265'),
('������', 'ϸ��', '��������', '89465263214', '20044', '56974516597', '154786523215'),
('�������', '�������', '����������', '89264586547', '17400', '1111111111', '222222222222'),
('�����', '����', '���������', '89175455644', '12000', '52698745152', '465231987454'),
('��������', '����', '����������', '89602545566', '16000', '41253698745', '562148932545'),
('�������', '�����', '��������', '87855556985', '142200', '58964235874', '453215896541'),
('������', '����', '��������', '89472226655', '15010', '45698213654', '159753684265'),
('������', 'ϸ��', '��������', '89465263214', '20010', '56974516597', '154786523215'),
('�������', '�������', '����������', '89264586547', '170050', '1111111111', '222222222222'),
('����������', '����', '���������', '89175455644', '19020', '52698745152', '465231987454'),
('����������', '����', '����������', '89602545566', '18050', '41253698745', '562148932545'),
('�������', '�����', '��������', '87855556985', '210000', '58964235874', '453215896541'),
('������', '����', '��������', '89472226655', '150342', '45698213654', '159753684265'),
('������', 'ϸ��', '��������', '89465263214', '20212', '56974516597', '154786523215'),
('�������', '�������', '����������', '89264586547', '17000', '1111111111', '222222222222'),
('����������', '����', '���������', '89175455644', '29000', '52698745152', '465231987454'),
('�����', '����', '����������', '89602545566', '18040', '41253698745', '562148932545'),
('�������', '�����', '��������', '87855556985', '11000', '58964235874', '453215896541'),
('�����', '����', '��������', '89472226655', '15050', '45698213654', '159753684265'),
('������', 'ϸ��', '��������', '89465263214', '20100', '56974516597', '154786523215'),
('�������', '�������', '����������', '89264586547', '17000', '1111111111', '222222222222'),
('������', '����', '���������', '89175455644', '13000', '52698745152', '465231987454'),
('�������', '����', '����������', '89602545566', '18000', '41253698745', '562148932545'),
('�����', '����', '��������', '89472226655', '15001', '45698213654', '159753684265'),
('������', 'ϸ��', '��������', '89465263214', '20100', '56974516597', '154786523215'),
('�������', '�������', '����������', '89264586547', '17000', '1111111111', '222222222222'),
('����������', '����', '���������', '89175455644', '12000', '52698745152', '465231987454'),
('����������', '����', '����������', '89602545566', '15000', '41253698745', '562148932545'),
('������', '����', '��������', '89472226655', '15000', '45698213654', '159753684265'),
('�����', 'ϸ��', '��������', '89465263214', '20000', '56974516597', '154786523215'),
('�������', '�������', '����������', '89264586547', '17000', '1111111111', '222222222222'),
('����������', '����', '���������', '89175455644', '19000', '52698745152', '465231987454'),
('��������', '����', '����������', '89602545566', '18000', '41253698745', '562148932545'),
('�������', '�����', '��������', '87855556985', '14000', '58964235874', '453215896541'),
('�������', '�����', '��������', '87855556985', '14000', '58964235874', '453215896541'),
('�����', '�����', '��������', '87855556985', '14000', '58964235874', '453215896541');

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
([IDClient], [IDClient_Size_Boots], [IDClient_Size_Clothes], [IDWork], [Cost], [StartDate], [EndDate])
values
('1', '1', '1', '1', '12000', cast(getdate() as date), '2020-03-09'),
('1', '1', '1', '2', '1250', '2017-11-22', '2018-02-01'),
('3', '2', '2', '2', '1210', '2017-10-05', '2018-01-27'),
('4', '1', '1', '1', '12000', cast(getdate() as date), '2020-03-09'),
('5', '1', '1', '2', '1250', '2017-11-22', '2018-02-01'),
('6', '2', '2', '2', '1210', '2017-10-05', '2018-01-27'),
('7', '1', '1', '1', '12000', cast(getdate() as date), '2020-03-09'),
('8', '1', '1', '2', '1250', '2017-11-22', '2018-02-01'),
('9', '2', '2', '2', '1210', '2017-10-05', '2018-01-27');

INSERT [dbo].[Comment]
([IDClient], [IDOrder], [IDWorker], [Comment])
values
('1', '1', '1', 'GOOD')

