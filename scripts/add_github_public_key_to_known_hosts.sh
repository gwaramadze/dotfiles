! grep -q github.com ~/.ssh/known_hosts || echo "Github public key already in ~/.ssh/known_hosts"; exit

ssh-keyscan github.com > github_public_key

if ssh-keygen -lf github_public_key | grep -q -E "SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8|16:27:ac:a5:76:28:2d:36:63:1b:56:4d:eb:df:a6:48"
then
   cat github_public_key >> ~/.ssh/known_hosts;
   echo "Github public key added to ~/.ssh/known_hosts"
else
   echo "Github fingerprint NOT OK!!! Aborting...";
fi

rm github_public_key;