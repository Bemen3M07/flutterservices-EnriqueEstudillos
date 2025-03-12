class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {

  @override
  void initState() {
    Provider.of<CarProvider>(context, listen: false).getCarsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      backgroundColor: const Color(0xffF5F8FC),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: SingleChildScrollView(
                  child: Column(
                    children:  [
                      const CustomTabBar(),
                      const SizedBox(
                        width: 0,
                      ),
                      const CustomSearch(),
                      const SizedBox(
                        width: 0,
                        height: 10,
                      ),
                      ListBrand(
                        brand: dataLogo,
                      ),
                      const SizedBox(
                        width: 0,
                        height: 10,
                      ),
                      Consumer<CarProvider>(
                        builder: (context, value, child) {

                          if(value.carsModel.isNotEmpty){
                            return ListCars(
                              cars: context.watch<CarProvider>().carsModel,
                            );
                          }

                          return const Center(
                            child: Text(messageErrorCarsApi),
                          );
                      },
                    ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 0,
                child: BottomActionBar()
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListCars extends StatelessWidget {
  const ListCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 56,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const[
              Text("All Cars",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
                ),
              ),
              Icon(Icons.filter_list_alt)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
          width: 0,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, item){
            return const ContainerCar();
          },
        )
        
      ],
    );
  }
}
