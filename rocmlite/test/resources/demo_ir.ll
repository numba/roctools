; ModuleID = 'copy_kernel_1d'
target datalayout = "e-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-n32"
target triple = "amdgcn--amdhsa"

define internal spir_func i32 @hsapy_devfn__5F__5F_main_5F__5F__2E_copy_5F_kernel_5F_1d_24_1_2E_array_28_float32_2C__20_1d_2C__20_C_29__2E_array_28_float32_2C__20_1d_2C__20_C_29_(i8** %.ret, i8* %arg.out.0, i8* %arg.out.1, i64 %arg.out.2, i64 %arg.out.3, float addrspace(4)* %arg.out.4, i64 %arg.out.5.0, i64 %arg.out.6.0, i8* %arg.inp.0, i8* %arg.inp.1, i64 %arg.inp.2, i64 %arg.inp.3, float addrspace(4)* %arg.inp.4, i64 %arg.inp.5.0, i64 %arg.inp.6.0) {
entry:
  %inserted.meminfo = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } undef, i8* %arg.out.0, 0
  %inserted.parent = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.meminfo, i8* %arg.out.1, 1
  %inserted.nitems = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.parent, i64 %arg.out.2, 2
  %inserted.itemsize = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.nitems, i64 %arg.out.3, 3
  %inserted.data = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.itemsize, float addrspace(4)* %arg.out.4, 4
  %.17 = insertvalue [1 x i64] undef, i64 %arg.out.5.0, 0
  %inserted.shape = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.data, [1 x i64] %.17, 5
  %.18 = insertvalue [1 x i64] undef, i64 %arg.out.6.0, 0
  %inserted.strides = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.shape, [1 x i64] %.18, 6
  %inserted.meminfo.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } undef, i8* %arg.inp.0, 0
  %inserted.parent.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.meminfo.1, i8* %arg.inp.1, 1
  %inserted.nitems.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.parent.1, i64 %arg.inp.2, 2
  %inserted.itemsize.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.nitems.1, i64 %arg.inp.3, 3
  %inserted.data.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.itemsize.1, float addrspace(4)* %arg.inp.4, 4
  %.19 = insertvalue [1 x i64] undef, i64 %arg.inp.5.0, 0
  %inserted.shape.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.data.1, [1 x i64] %.19, 5
  %.20 = insertvalue [1 x i64] undef, i64 %arg.inp.6.0, 0
  %inserted.strides.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.shape.1, [1 x i64] %.20, 6
  %out = alloca { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  %inp = alloca { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %inp
  %"$0.1" = alloca i8*
  store i8* null, i8** %"$0.1"
  %"$0.2" = alloca i8*
  store i8* null, i8** %"$0.2"
  %"$const0.3" = alloca i64
  store i64 0, i64* %"$const0.3"
  %"$0.4" = alloca i64
  store i64 0, i64* %"$0.4"
  %i = alloca i64
  store i64 0, i64* %i
  %.56 = alloca { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.56
  %"$0.7" = alloca i64
  store i64 0, i64* %"$0.7"
  %"$0.8" = alloca i1
  store i1 false, i1* %"$0.8"
  %.78 = alloca { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.78
  %"$30.3" = alloca float
  store float 0.000000e+00, float* %"$30.3"
  %.114 = alloca { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.114
  %"$const47.1" = alloca i8*
  store i8* null, i8** %"$const47.1"
  %"$47.2" = alloca i8*
  store i8* null, i8** %"$47.2"
  br label %B0

B0:                                               ; preds = %entry
  %.22 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  %.25 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %inp
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides.1, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %inp
  %.28 = load i8*, i8** %"$0.1"
  store i8* null, i8** %"$0.1"
  %.30 = load i8*, i8** %"$0.1"
  %.32 = load i8*, i8** %"$0.2"
  store i8* null, i8** %"$0.2"
  %.34 = load i8*, i8** %"$0.1"
  store i8* null, i8** %"$0.1"
  %.37 = load i64, i64* %"$const0.3"
  store i64 0, i64* %"$const0.3"
  %.39 = load i64, i64* %"$const0.3"
  %.40 = trunc i64 %.39 to i32
  %.41 = call spir_func i64 @_Z13get_global_idj(i32 %.40)
  %.43 = load i64, i64* %"$0.4"
  store i64 %.41, i64* %"$0.4"
  %.45 = load i64, i64* %"$const0.3"
  store i64 0, i64* %"$const0.3"
  %.47 = load i8*, i8** %"$0.2"
  store i8* null, i8** %"$0.2"
  %.49 = load i64, i64* %"$0.4"
  %.51 = load i64, i64* %i
  store i64 %.49, i64* %i
  %.53 = load i64, i64* %"$0.4"
  store i64 0, i64* %"$0.4"
  %.55 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %.55, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.56
  %.59 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.56, i32 0, i32 2
  %.60 = load i64, i64* %.59
  %.62 = load i64, i64* %"$0.7"
  store i64 %.60, i64* %"$0.7"
  %.64 = load i64, i64* %i
  %.65 = load i64, i64* %"$0.7"
  %.66 = icmp slt i64 %.64, %.65
  %.68 = load i1, i1* %"$0.8"
  store i1 %.66, i1* %"$0.8"
  %.70 = load i64, i64* %"$0.7"
  store i64 0, i64* %"$0.7"
  %.72 = load i1, i1* %"$0.8"
  br i1 %.72, label %B30, label %B47

B30:                                              ; preds = %B0
  %.74 = load i1, i1* %"$0.8"
  store i1 false, i1* %"$0.8"
  %.76 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %inp
  %.77 = load i64, i64* %i
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %.76, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.78
  %.81 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.78, i32 0, i32 5
  %.82 = getelementptr inbounds [1 x i64], [1 x i64]* %.81, i32 0, i32 0
  %.83 = load i64, i64* %.82, !range !7
  %.84 = insertvalue [1 x i64] undef, i64 %.83, 0
  %.85 = extractvalue [1 x i64] %.84, 0
  %.86 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.78, i32 0, i32 6
  %.87 = load [1 x i64], [1 x i64]* %.86
  %.88 = extractvalue [1 x i64] %.87, 0
  %.89 = icmp slt i64 %.77, 0
  %.90 = add i64 %.77, %.85
  %.91 = select i1 %.89, i64 %.90, i64 %.77
  %.92 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.78, i32 0, i32 5
  %.93 = getelementptr inbounds [1 x i64], [1 x i64]* %.92, i32 0, i32 0
  %.94 = load i64, i64* %.93, !range !7
  %.95 = insertvalue [1 x i64] undef, i64 %.94, 0
  %.96 = extractvalue [1 x i64] %.95, 0
  %.97 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.78, i32 0, i32 6
  %.98 = load [1 x i64], [1 x i64]* %.97
  %.99 = extractvalue [1 x i64] %.98, 0
  %.100 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.78, i32 0, i32 4
  %.101 = load float addrspace(4)*, float addrspace(4)** %.100
  %.102 = mul i64 %.91, 1
  %.103 = add i64 0, %.102
  %.104 = getelementptr float, float addrspace(4)* %.101, i64 %.103
  %.105 = load float, float addrspace(4)* %.104
  %.107 = load float, float* %"$30.3"
  store float %.105, float* %"$30.3"
  %.109 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %inp
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %inp
  %.111 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  %.112 = load float, float* %"$30.3"
  %.113 = load i64, i64* %i
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %.111, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.114
  %.117 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.114, i32 0, i32 5
  %.118 = getelementptr inbounds [1 x i64], [1 x i64]* %.117, i32 0, i32 0
  %.119 = load i64, i64* %.118, !range !7
  %.120 = insertvalue [1 x i64] undef, i64 %.119, 0
  %.121 = extractvalue [1 x i64] %.120, 0
  %.122 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.114, i32 0, i32 6
  %.123 = load [1 x i64], [1 x i64]* %.122
  %.124 = extractvalue [1 x i64] %.123, 0
  %.125 = icmp slt i64 %.113, 0
  %.126 = add i64 %.113, %.121
  %.127 = select i1 %.125, i64 %.126, i64 %.113
  %.128 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.114, i32 0, i32 5
  %.129 = getelementptr inbounds [1 x i64], [1 x i64]* %.128, i32 0, i32 0
  %.130 = load i64, i64* %.129, !range !7
  %.131 = insertvalue [1 x i64] undef, i64 %.130, 0
  %.132 = extractvalue [1 x i64] %.131, 0
  %.133 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.114, i32 0, i32 6
  %.134 = load [1 x i64], [1 x i64]* %.133
  %.135 = extractvalue [1 x i64] %.134, 0
  %.136 = getelementptr inbounds { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %.114, i32 0, i32 4
  %.137 = load float addrspace(4)*, float addrspace(4)** %.136
  %.138 = mul i64 %.127, 1
  %.139 = add i64 0, %.138
  %.140 = getelementptr float, float addrspace(4)* %.137, i64 %.139
  store float %.112, float addrspace(4)* %.140
  %.142 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  %.144 = load i64, i64* %i
  store i64 0, i64* %i
  %.146 = load float, float* %"$30.3"
  store float 0.000000e+00, float* %"$30.3"
  br label %B47

B47:                                              ; preds = %B30, %B0
  %.149 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %out
  %.151 = load { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %inp
  store { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } zeroinitializer, { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] }* %inp
  %.153 = load i64, i64* %i
  store i64 0, i64* %i
  %.155 = load i1, i1* %"$0.8"
  store i1 false, i1* %"$0.8"
  %.158 = load i8*, i8** %"$const47.1"
  store i8* null, i8** %"$const47.1"
  %.160 = load i8*, i8** %"$const47.1"
  %.162 = load i8*, i8** %"$47.2"
  store i8* %.160, i8** %"$47.2"
  %.164 = load i8*, i8** %"$const47.1"
  store i8* null, i8** %"$const47.1"
  %.166 = load i8*, i8** %"$47.2"
  store i8* %.166, i8** %.ret
  ret i32 0
}

declare spir_func i64 @_Z13get_global_idj(i32)

define spir_kernel void @hsaPy_hsapy_devfn__5F__5F_main_5F__5F__2E_copy_5F_kernel_5F_1d_24_1_2E_array_28_float32_2C__20_1d_2C__20_C_29__2E_array_28_float32_2C__20_1d_2C__20_C_29_(i8 addrspace(1)* %.1, i8 addrspace(1)* %.2, i64 %.3, i64 %.4, float addrspace(1)* %.5, i64 %.6, i64 %.7, i8 addrspace(1)* %.8, i8 addrspace(1)* %.9, i64 %.10, i64 %.11, float addrspace(1)* %.12, i64 %.13, i64 %.14) {
.16:
  %.17 = addrspacecast i8 addrspace(1)* %.1 to i8*
  %.18 = addrspacecast i8 addrspace(1)* %.2 to i8*
  %.19 = addrspacecast float addrspace(1)* %.5 to float addrspace(4)*
  %.20 = addrspacecast i8 addrspace(1)* %.8 to i8*
  %.21 = addrspacecast i8 addrspace(1)* %.9 to i8*
  %.22 = addrspacecast float addrspace(1)* %.12 to float addrspace(4)*
  %inserted.meminfo = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } undef, i8* %.17, 0
  %inserted.parent = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.meminfo, i8* %.18, 1
  %inserted.nitems = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.parent, i64 %.3, 2
  %inserted.itemsize = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.nitems, i64 %.4, 3
  %inserted.data = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.itemsize, float addrspace(4)* %.19, 4
  %.23 = insertvalue [1 x i64] undef, i64 %.6, 0
  %inserted.shape = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.data, [1 x i64] %.23, 5
  %.24 = insertvalue [1 x i64] undef, i64 %.7, 0
  %inserted.strides = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.shape, [1 x i64] %.24, 6
  %inserted.meminfo.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } undef, i8* %.20, 0
  %inserted.parent.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.meminfo.1, i8* %.21, 1
  %inserted.nitems.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.parent.1, i64 %.10, 2
  %inserted.itemsize.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.nitems.1, i64 %.11, 3
  %inserted.data.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.itemsize.1, float addrspace(4)* %.22, 4
  %.25 = insertvalue [1 x i64] undef, i64 %.13, 0
  %inserted.shape.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.data.1, [1 x i64] %.25, 5
  %.26 = insertvalue [1 x i64] undef, i64 %.14, 0
  %inserted.strides.1 = insertvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.shape.1, [1 x i64] %.26, 6
  %.27 = alloca i8*
  store i8* null, i8** %.27
  %extracted.meminfo = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides, 0
  %extracted.parent = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides, 1
  %extracted.nitems = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides, 2
  %extracted.itemsize = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides, 3
  %extracted.data = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides, 4
  %extracted.shape = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides, 5
  %.29 = extractvalue [1 x i64] %extracted.shape, 0
  %extracted.strides = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides, 6
  %.30 = extractvalue [1 x i64] %extracted.strides, 0
  %extracted.meminfo.1 = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides.1, 0
  %extracted.parent.1 = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides.1, 1
  %extracted.nitems.1 = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides.1, 2
  %extracted.itemsize.1 = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides.1, 3
  %extracted.data.1 = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides.1, 4
  %extracted.shape.1 = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides.1, 5
  %.31 = extractvalue [1 x i64] %extracted.shape.1, 0
  %extracted.strides.1 = extractvalue { i8*, i8*, i64, i64, float addrspace(4)*, [1 x i64], [1 x i64] } %inserted.strides.1, 6
  %.32 = extractvalue [1 x i64] %extracted.strides.1, 0
  %.33 = call spir_func i32 @hsapy_devfn__5F__5F_main_5F__5F__2E_copy_5F_kernel_5F_1d_24_1_2E_array_28_float32_2C__20_1d_2C__20_C_29__2E_array_28_float32_2C__20_1d_2C__20_C_29_(i8** %.27, i8* %extracted.meminfo, i8* %extracted.parent, i64 %extracted.nitems, i64 %extracted.itemsize, float addrspace(4)* %extracted.data, i64 %.29, i64 %.30, i8* %extracted.meminfo.1, i8* %extracted.parent.1, i64 %extracted.nitems.1, i64 %extracted.itemsize.1, float addrspace(4)* %extracted.data.1, i64 %.31, i64 %.32)
  %.34 = icmp eq i32 %.33, 0
  %.35 = icmp eq i32 %.33, -2
  %.36 = or i1 %.34, %.35
  %.37 = xor i1 %.36, true
  %.38 = icmp eq i32 %.33, -1
  %.39 = icmp eq i32 %.33, -3
  %.40 = icmp sge i32 %.33, 1
  %.41 = load i8*, i8** %.27
  ret void
}

!opencl.kernels = !{!0}
!opencl.ocl.version = !{!6}
!opencl.spir.version = !{!6}

!0 = !{void (i8 addrspace(1)*, i8 addrspace(1)*, i64, i64, float addrspace(1)*, i64, i64, i8 addrspace(1)*, i8 addrspace(1)*, i64, i64, float addrspace(1)*, i64, i64)* @hsaPy_hsapy_devfn__5F__5F_main_5F__5F__2E_copy_5F_kernel_5F_1d_24_1_2E_array_28_float32_2C__20_1d_2C__20_C_29__2E_array_28_float32_2C__20_1d_2C__20_C_29_, !1, !2, !3, !4, !5}
!1 = !{!"kernel_arg_addr_space", i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 0}
!2 = !{!"kernel_arg_access_qual", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none", !"none"}
!3 = !{!"kernel_arg_type", !"i8 addrspace(1)* ", !"i8 addrspace(1)* ", !"i64", !"i64", !"float addrspace(1)* ", !"i64", !"i64", !"i8 addrspace(1)* ", !"i8 addrspace(1)* ", !"i64", !"i64", !"float addrspace(1)* ", !"i64", !"i64"}
!4 = !{!"kernel_arg_type_qual", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !"", !""}
!5 = !{!"kernel_arg_base_type", !"i8 addrspace(1)* ", !"i8 addrspace(1)* ", !"i64", !"i64", !"float addrspace(1)* ", !"i64", !"i64", !"i8 addrspace(1)* ", !"i8 addrspace(1)* ", !"i64", !"i64", !"float addrspace(1)* ", !"i64", !"i64"}
!6 = !{i32 2, i32 0}
!7 = !{i64 0, i64 9223372036854775807}
