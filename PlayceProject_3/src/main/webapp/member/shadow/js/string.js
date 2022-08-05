function getJosa(str, tail) 
{ 
    strTemp = str.substr(str.length - 1); 
    return ((strTemp.charCodeAt(0) - 16) % 28 != 0) ? str + tail.substr(0, 1) : str + tail.substr(1, 1); 
}
//Ÿ�Ժ� (�񱳹��� , ������ ; ex: getTypeCheck(string , "1234567890") ) 
function getTypeCheck (s, spc)
{
	var i;

	for(i=0; i< s.length; i++) 
	{
		if (spc.indexOf(s.substring(i, i+1)) < 0) 
		{
			return false;
		}
	}        
	return true;
}

//�޸����� (number_format)
function commaSplit(srcNumber) 
{ 
	var txtNumber = '' + srcNumber; 

	var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])'); 
	var arrNumber = txtNumber.split('.'); 
	arrNumber[0] += '.'; 
	do { 
		arrNumber[0] = arrNumber[0].replace(rxSplit, '$1,$2'); 
	} 
	while (rxSplit.test(arrNumber[0])); 
	if (arrNumber.length > 1) { 
		return arrNumber.join(''); 
	} 
	else { 
		return arrNumber[0].split('.')[0]; 
	} 
}

//�޸�����
function filterNum(str) 
{ 
	return str.replace(/^\$|,/g, ""); 
}
//����üũ
function commaInsert(field)
{
	if (!getTypeCheck(field.value , "0123456789,"))
	{
		alert('���ڸ� �Է��� �ּ���.       ');
		field.value = '';
		field.focus();
		return false;
	}
	field.value = commaSplit(filterNum(field.value));
}