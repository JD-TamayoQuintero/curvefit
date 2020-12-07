/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_MEDT_info.c
 *
 * GPU Coder version                    : 1.4
 * CUDA/C/C++ source code generated on  : 06-Dec-2020 18:02:22
 */

/* Include Files */
#include "_coder_MEDT_info.h"
#include "emlrt.h"
#include "tmwtypes.h"

/* Function Declarations */
static const mxArray *emlrtMexFcnResolvedFunctionsInfo(void);

/* Function Definitions */

/*
 * Arguments    : void
 * Return Type  : const mxArray *
 */
static const mxArray *emlrtMexFcnResolvedFunctionsInfo(void)
{
  const mxArray *nameCaptureInfo;
  const char * data[22] = {
    "789ced5d496fe3c815666f9e1e049d0906c88264901e23c000410396e4b1647b02246dedb22c896e2d5e3a039b224b122d924573d176f229c82140720906c829"
    "c829402e7d48801c72d02540805c721824bf20406ef90b23a95cb6cc693665b34499543dc023d53cf17daf5eb13ebe7e2c169907b9c2038661bec92079fa25fa",
    "7c36fa7b38fafbd6e5ff7fc8dc14abfec1e5e72796369627cce3abe3a6f5bfbefce4a162809e811a0a2783ab2305288b0aa71895be0a180de850ea0061a26988"
    "12a88832d883538dac386ac8e929d55563ac1a7f4fb400df2e9b32a3b5f46b0fa5e9c6553c7e3fd55f66aabf8fdf128f693deedf4f6de231feddc329fdebd4e7",
    "c9cf4249c89b32500ca88792406f1b500df1a6d6010dd108d5354ee15b400fd5d6c26be1f550d31405102aa492953519f93bb677ead2df47b6fe3e9ad897b9de"
    "a44d0aef3d5bbcf726f625d814794ebac27be3122f678b87ec63fdebdcde61eaf3c4672156834d8d933f1e9f387aa8b053d9db89875ead8723dbf59001a15487",
    "bd1090a59024d6433267485c3d247006d7309551b3371e9a8938c56b6546ffad9f58de679e5e7e1bc6129ffc67c73b3c24cb82d7b3b137ebf9f71d1b3c7cfe61"
    "7d7ea3da8e27a5dca0dc3f94364ae5aa91684b996b3f58071c273f189bb657f6fd3e8fdd9e07df73f01feb7928006d4d1c5d1c358593d6144e6b8aa3cb40db2d",
    "ff5ac5ce0f2c186f78473c6cffd4d2b6e261fdadc64d6f711a104293585dfe773c8c2fd0d717387aa1abe8adc9def1c7c5dfbf58a57cec773e6e6eedc7b71b91"
    "ade24eb6563f2e66ceb9cdf5413c387c3cb4393e68f37ad6fe3cb1edcf9389fd8604a1c690cb83572ced6bbc95897d019a7509f8ebfa09a4f1d57312a905e4c1",
    "2f37691eec7fde1d14229d04cfb7325215d4527278838da9319a07df9b797ce1d2ffe70efe63bd250f16f5b8294a464e299a32d0447e613cfc0f97784d5b3c64"
    "1febe772ddb4467134ba1ef2f31ffeff8cf2b3eff939ac8a793dc59792ac986e452b5b3bf5682945f93928fcfc0307ffb1dec2cf3acf499cb686b364f779b255",
    "66ad57fcf58e78d87ed5010feb6f3d7ee3bfaf11f20b14b7a9b1f4b06e1ca5f9b2fff9b8563a4f9a5a7c2fb9a3c4ce8fb64027516af40354a7f03b1fffc6a5ff"
    "3f76f01feb2d7ccca9aad42f4fc8256d2abc214225a7b012c7e3fbacd83fd5a57f1f38f887f58d4b2f4e5a9c228c126a52f974dd011febc9f0b57d58f1c07b58",
    "6736fefc9cf2b7dff93bd68eb60fca878252978eb777a17e7cc4c6c500d53b966d7ecfdaafa796f675bf9e4eec8bbaae729a0efc5a6f2edae221fb58efe6ba3b"
    "8ed0f8ca8b6335cbba1882fcbbf7fe47947ffdcebfe709f88a8dd5c3afb6b2855742b855db34a54a92f2ef7de7df0b97fdba2f758ebbf233ad73bcfd130bad73",
    "788347eb1c64ecfba1ce31cff571df75f01feb2d7c2c8b4a492b703d623cfcd8d2bef6e3f1c43edfe226c44f6adc584b9b99faddf47947868771b83c5d0f47d7"
    "27cf11cf2bfe4d27ce9abba39cacc1f6336a85cbf4cf0d890d509dc2eff398ae4fbe1d1eb67f6a695bf1b07ed1eb18e9fa647fe0d1f5c964ecbbad5b346cece3",
    "38623d693e5e354793ba5fd2e2e2f83329ea2a67f02dfa1cc9f08e7894a7978337bdc6a33c4dc67e5079fac265bf3e72e817d65b787ae2550117351872f5e5db"
    "d635fc555fbe1136afebcbbffa5d91f2b4df79ba92edd692c7079de8f9ae20ecc39d4f0f8ea22040f58da0cc679a3fdf0e8fe6cfcbc1935ee3d1fc998cfda0f0",
    "f22f5df6e3470efdc07a0b2ff350d18d2254caa2d294800195a488ee4c92ca9b6fbb5fd1d025decf6df1907dac27339e6f0b1fbab5ebe17381f4fee01cf1bce2"
    "69b1b271c4a6abb5de71baa2699fc6d733b9583e1d1c9e1eda1c1fb4797d5fd72f7bbd6f1c5dbf4c1a0fc9b2e0d1f5cb64ec07253f5ed0fa38b4ee36d55c583e",
    "ec9687594b9b99fa1df97535385c5ed6295ebef9d34bcac37ee7e164bebcbf29826ab3a7f54d2913cbcb91583840f9afdfe7b1ead2ff6796b6d57fac177505ed"
    "ad638cb7af5e5c1dc2ed78956cf1907dacbf53fedb107b4050e168b84237e2e5e97e44173ffbe21b9477fdcebbf9685e6523d9b6d06a82f32cd7dddc37e40dca",
    "bbf786774f5dfaef5c676888a37f4eb7fccab3bbb678c83ed6bbe7591427eff7a9607e4279d6ff3c5bcd34a5c881d4ef6ea5f47a422e7622e91408d0be6f6eeb"
    "0c8736f6711cb19e34cfae36444d371aa257ebc4c63c326e2f8a6fffe8122f6d8b87ec633d09bef5b69efb7293f2acff7936a2568eb30abf51ec29679d74b898",
    "d232bd4c8078d6aff3d7eff503af9f6ba6f503d2784896058fd60fc8d8f76d5e3b001ad44d0feb0874bd025daf707ff8cf6b3cba5e818cfda0ac573875d90fa7"
    "f72989ba06bb04f182f85e51208dbe8426915ac0fb942e1e4a1f50bebdaf7cfb6d1b3c7cfe617db511ad2bf904ec1eb2b070deda8ce889339d090edf06751e93",
    "cb6b47d89ad8f32bcfeed9e221fb584f627c50a43c7ffe81f2ec1cf1bcca6b7bcd4e8a3d3a62bb09bd5ecbd6a10cb6ebc578707896e6b5489cf9968792292b94"
    "6f9df91645ca6bbe1d3ea07ceb7fbe4df3e5286776c39928cb6bd5dc1eb7cef36680eab6419dc734af4542f35ad2784896058fe6b564ecd3bc1609bd3f8684de",
    "1f9b150fc9b2e0d1fb6364ecffcbe6f859e3d8b6b18fe388f573e1dbd51bedeb4d231972e7097dced78a77f3bca4cff9ce8a876459f0e873be64ec079d9f4f5d"
    "f68fae6b4042d735cc8a876459f0e8ba0632f6290fbfbb7ff43e1c127a1f6e563c24cb8247efc391b14f79f8ddfda3756324b46e3c2b1e9265c1a3756332f683",
    "cec3172efbf7dca17f588feac64dd5bcae1d8b7a4635530a579780e0faba60153b7fb0603cb7ef91e21df0b0fe75ced5eb2df0488f023835dcd3115c536ff4eb"
    "d4c66f827cf3db8b3dcadf7ee76fbe9488e6b2bdedbc9954075ab87036d8918400e5d16ee737b0b18fe388f5f3e16fddd0440108532f665bf0fd3e5583822e0e",
    "c0c2f68718bac47b6d8b87ec63bddbf7117d6d6871e42e2bcf1ed63be03f37284ffb9da7b753e70791bd64bb9fe2a1992bf0e5c8202d04e83d7141e5e90b97fd"
    "fabe43bfb0dec2d3a2228051c2df197985f40bbe6e4cfcc92906b1f58f65073fb09ecc784f85d373fe666a1f1a5f52fe9e139e57fcbd993e56f5b3f57a63abd9",
    "2fea9d08df3ce866297f079ebf7fe8d02fac1fb9793272efa401350942f5047680d69060f7846f01beedbe6e6e9559eb23c33be261fba796b6150feb5ddd4f44"
    "c3fc8ef879b9de6ef8b7ff3ef937e5eb39e179c5d77a3ed54b25070376b7b7be51580f27f67722e100ed87f93f9be3678de32f6cece33862fdbce7f5eabb7f70",
    "d202920a34eff6b3b4ee537c5ff26dbfee7f7a6ae317ddbfd81f7874ff6232f6295fdfaddf2b96f675bf57105f2b863c4ef81755cf7ee3126faeeff1b8b95e6f"
    "1229efdfe3317cf4978f293ffb9d9f37d2b15cbf01fb854c2dd26df54445867281f233e567db7e5ff3b3a8507e9e8d9f4585f273b0f0bce2e732bb7e26c753fd",
    "8c90d8e70e40c1a89d95aa01aa4f0f6d8e5f781d73a6fab47cf93592a475e97b3e9eb42e7da3bd2c78b42eedcefe5743489482",
    "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(&data[0], 54304U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/*
 * Arguments    : void
 * Return Type  : mxArray *
 */
mxArray *emlrtMexFcnProperties(void)
{
  mxArray *xResult;
  mxArray *xEntryPoints;
  const char * epFieldName[6] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs", "FullPath", "TimeStamp" };

  mxArray *xInputs;
  const char * propFieldName[4] = { "Version", "ResolvedFunctions",
    "EntryPoints", "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 6, epFieldName);
  xInputs = emlrtCreateLogicalMatrix(1, 1);
  emlrtSetField(xEntryPoints, 0, "Name", emlrtMxCreateString("MEDT"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", emlrtMxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", emlrtMxCreateDoubleScalar
                (1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  emlrtSetField(xEntryPoints, 0, "FullPath", emlrtMxCreateString(
    "D:\\Documentos\\Desktop\\curvefit\\branches\\V.0.02\\guide\\MEDT.m"));
  emlrtSetField(xEntryPoints, 0, "TimeStamp", emlrtMxCreateDoubleScalar
                (738129.67347222217));
  xResult = emlrtCreateStructMatrix(1, 1, 4, propFieldName);
  emlrtSetField(xResult, 0, "Version", emlrtMxCreateString(
    "9.7.0.1296695 (R2019b) Update 4"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

/*
 * File trailer for _coder_MEDT_info.c
 *
 * [EOF]
 */
