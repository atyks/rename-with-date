@echo off

rem ネットワークドライブの場合もあるので、cd ではなくpushdを使う。最後にpopdで戻す
pushd %~dp1

setlocal ENABLEDELAYEDEXPANSION

set x=%*
for %%f in (!x!) do (

	rem ファイル更新日を加工する
	rem "2022/11/29 17:23" ⇒ "2022-11-29"
	set MODDATE=%%~tf
	set MODDATE=!MODDATE:/=-!
	set MODDATE=!MODDATE: =%!
	set MODYMD=!MODDATE:~0,10!

	set TARGET_FILENAME=%%~nf%%~xf
	set NEW_FILENAME=!MODYMD!_!TARGET_FILENAME!

	rem ファイルのステータスを取得
	set A=%%~af

	if not exist "!NEW_FILENAME!" (
		rem 対象がファイルであることを確認し、リネーム。ディレクトリなどは対象外
		set TYPE=!A:~0,1!
		IF !TYPE!==- copy "!TARGET_FILENAME!" "!NEW_FILENAME!"
	)
	rem 元ファイルを消す。必要に応じてコメントを外す
	rem del "!TARGET_FILENAME!"
)

endlocal

popd
