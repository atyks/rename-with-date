@echo off

rem �l�b�g���[�N�h���C�u�̏ꍇ������̂ŁAcd �ł͂Ȃ�pushd���g���B�Ō��popd�Ŗ߂�
pushd %~dp1

setlocal ENABLEDELAYEDEXPANSION

set x=%*
for %%f in (!x!) do (

	rem �t�@�C���X�V�������H����
	rem "2022/11/29 17:23" �� "2022-11-29"
	set MODDATE=%%~tf
	set MODDATE=!MODDATE:/=-!
	set MODDATE=!MODDATE: =%!
	set MODYMD=!MODDATE:~0,10!

	set TARGET_FILENAME=%%~nf%%~xf
	set NEW_FILENAME=!MODYMD!_!TARGET_FILENAME!

	rem �t�@�C���̃X�e�[�^�X���擾
	set A=%%~af

	if not exist "!NEW_FILENAME!" (
		rem �Ώۂ��t�@�C���ł��邱�Ƃ��m�F���A���l�[���B�f�B���N�g���Ȃǂ͑ΏۊO
		set TYPE=!A:~0,1!
		IF !TYPE!==- copy "!TARGET_FILENAME!" "!NEW_FILENAME!"
	)
	rem ���t�@�C���������B�K�v�ɉ����ăR�����g���O��
	rem del "!TARGET_FILENAME!"
)

endlocal

popd
