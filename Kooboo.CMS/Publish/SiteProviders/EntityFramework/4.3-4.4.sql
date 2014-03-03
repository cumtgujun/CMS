/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Kooboo_CMS_Sites_Labels ADD
	UUID nvarchar(128) NULL,
	UtcCreationDate datetime NULL,
	UtcLastestModificationDate datetime NULL,
	LastestEditor nvarchar(128) NULL
GO
ALTER TABLE dbo.Kooboo_CMS_Sites_Labels SET (LOCK_ESCALATION = TABLE)
GO


UPDATE Kooboo_CMS_Sites_Labels SET  UUID = newid() WHERE UUID is null

INSERT INTO [__MigrationHistory]
           ([MigrationId]
           ,[ContextKey]
           ,[Model]
           ,[ProductVersion])
     VALUES
           (CONVERT(varchar(100), GETDATE(), 112) + '99999999_4.3_4.4'
           ,'Kooboo.CMS.Sites.Persistence.EntityFramework.SiteDBContext'
           ,CONVERT(varbinary(max),'1F8B0800000000000400ED5DCD72DB3610BE77A6EFA0E1A93DC4B49D1E928C9C8C2DD9AD2771EC31ED4C6F198884643624A01290C77AB61EFA487D8582147F4000244091922C9B37115C7CBBC07EC4EF02FAEF9F7F879F9EC260F00823E26374621D1D1C5A03885CECF96876622DE8F4CD3BEBD3C79F7F1A9E7BE1D3E05B26F7369663391139B11E289D7FB06DE23EC0109083D077234CF0941EB838B48187EDE3C3C3F7F6D1910D1984C5B00683E1ED02513F84C9037B1C61E4C2395D80E00A7B3020693A7BE324A883AF2084640E5C78628D98C4851F119AA75983D3C007CC120706536B0010C2145066E7877B021D1A613473E62C010477CB39647253101098DAFFA110372DCAE1715C14BBC8B856555879215931CF5975D0656C5E52D413EB06CCE02A919763929FE1B294C0926E223C87115DDEC2699ADBF1298C7F59035B2F7CB1080295F0D01675E5992535B1E5EC99468C36D6E00A3C7D8168461F18A18EDF59830BFF097A594A5AF9F7C8672C639968B4608F5F99116012C0FCBD5DABB9B079DB9A6F4004118DDDD381EE7A5597640CA76011D04CD319C60104A8B1CDD793BFA04BFF0C831A93D9CFC6260FED82B75A368F2330A53DA57B4ABF0C4AFF41C3E02CC0EE8F2D517ADFE8BC1BAD67D85BEE8A112340E10C47CB2D112253B76FC428DBBD59EDC6BEFB022630D8E1975CEBE17DF2AE4EEBE1F16F9B24D5F60BFC0D048BBA12AFD3E4C85AEEEF2FC71BEF9CEFA93B8A6032A319B3FACCF4C5BFEF7C45232367FF02088584B2499C3FF5DDB591529873CFA738EAB8D8C64D42FC0DB1F963B4A5562156B56F4D7961F3B635EF7CF81757FAFACC587F7EB2EB594247BA9FB977EFA3E0167A7EC4AC58DFC9AB36DBE0D3AF6A27F46CE8A85B68C884DD35385D12A39B81E36841280ECFA308B7E8287AA6BC02A69C9EDD2E02E8404A991DEB73E5D26BEEFC38CFAA162E117D7BAC2811B766EEB03117FC1D2218B1D19A77032885118A31E0CAE6ED8C547747B4FDE355BC72D79A577D1BF42ADAA0982B776C6E750BC922E807373D5DEAE912D746DFB4F45CA9E0CA08230A7C3654C846C3D9DE7CFE42E0CB2A1B6394B8CDED43620D0A55ABBDFC036E175CAC101552B1C5580DC76F43EA30CB7B3C6A4C711F488759DA2550430A1B093AC462ED5A0DC7AF6DEBB04A8B5E6A38615DCC0451836688244ECAD580F2D45DEB11610A57E11469A2A7C39507FC6A64D5C4408F2D0EFAAAB0E5C1A119B63048A88397C6137A0D62BF52052FF73FCAD6296F6EF277437B153994260CED8A10A3E11598CF193A177294A60C9C34DEE88DD33CBE275C61D82E5184F9E4D6E69AD8942B6FE9F2B75C733A06144C40DC368FBCB05A4CDBEA660A158DAFD83B17CEC832C5BF85663E7E4C42B00EAAE295F81ABD60850CD92C32292FCC8DAA0E764AB33B2E084054D9F78E70B008916EC9BD1AA95852E591AA9668EB90F8400A1E8B4F3747E3622578302ED91C8B1B2FF0585CB28C35B405BF8914B1258E08A3369177C6AC2C77E41D50B332F8280134E1672D424FD25746527964D892A4B5E14409A08EA45A84CD935446698AB08ADFE1115629CFC6F1D2F0BDA5DFEB82868CDCAE03D8BCD7CB013D3C5A5D88D20E7D589E30B5746065E49091F76A73EFC3075B04DEA81CDF04290DA4E161D224738CD532100FA15E7BAA411063604A60E2CB46B895C131828A4A39736D42000DAF4078F56C3E4A69E5A1E5775917BE93E0E93E4D1DC0E6BFCE22BCA6C4908A40A13AA43D1A5995D68B3AE0402BFF37F57DD7A374198B4F7F91FE57ADF2B5A481269AC7880D06189BEB94BA6B52F68808AA65D9B683EDFA601D23221860F444E89408EA75F49654D046E31891C108A572E9C413D64CA4C89E9E4C1B20936AE3A4359934213886643240E9E9B0013A28F6BA3A61447DA04D0352E8817A5E74CC0BD50E656B5268C2690C196180D2D3610D3A48BBC9A248AE3D4DC99FF3DDE47427B7C12D16D9D6EE4AC41AB04A7AF4BD785BD759120AC38358E0C0F93B18053E2B6F217005903F65EDC21DFE01D189757C78742C5C84B1C6A51436215EF0026FA6408F20721F4024C766B53CA5DF19B07C08DF047AAD33F7139FB60F38CBACFB25044FBFD69BF40AAE89E8F9B50FFCDACF3B1B3AA3C04640F91B1736E1B3BDBE55A1B35A565D9AB026787F27C2D63FABE4D28396371A74666EE9C282065FAC8CC407DD77D59954DC41E0B1DF34B939A0319CE64E827591957714AC570B2FFF4A82CEC82BDE38D019F056C61FCFE5D2808E07954DA1D73A67B9097FECE331FFCE7CB7B16FD4DC75AFEDE07DEFBB6C75F5191C85F7E3C534ED61F7A6FDD373F176B76DECEB3B9FDE7FAABCF7F6F0C478EFC0AA9DACDE7BCFDC7B95A7AAF3638065CBF22D2D7987A6FE48F56ACF89CD812798956265ED678C27187F1F5D39DFE3BA23DFE30C447BA4533A5AAD545C9230D69EE4D29B209DC4964C90248C4CC873E94D104F6E4B1688024606240B71694EDFC017A503DF9209A5B7E6FAF56AC583E1926651C0487996C94C7FADEEC67AF53A15A7CD25D50A19230BB87C06CC938FA7CBE493658C0CE1F2E90D519E66974C514A191953CA69628EE200BCC21C8594A1395C4E5373E403F31516C9820D8C2A329BD8A53869AF304A216568119793A83B438343FC7278C5D0E6FF4A643886C49F1510F11F8B20F6FDF81815A099CC259AE2AC536796F1166522429F7F0529F0581F7C1A517F0A5CCA5EBB9090E4E2956459FDC43A0F27D0BB44D70B3A5FD053426038094A9B1543BB5E7F725341D9E6E1F53C7E225D148199E9C74BDED7E86CE1075E6EF78562905201110F47D22933B3CAA1F1D479B6CC91BE6264089456DF18CE218A27DC77309C070C8C5C23073CC26ADBF47558AEB1E1D807B3088424C528F2B347463F2F7CFAF83F5B311F040C670000',2)
           ,'6.0.0-rc1-20726')
		   
COMMIT

