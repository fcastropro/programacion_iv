import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';
import Saludo from "./src/components/Saludo";
import SaludoProps from './src/components/SaludoProps';
import Contador from './src/components/Contador';
import Caja from './src/components/Caja';
import Perfil from './src/components/Perfil';

export default function App() {
  return (
    <View style={styles.container}>
      <Saludo />
      <SaludoProps nombre="Fernando"/>
      <Contador />
      <Caja />
      <Perfil />
      <Text style={{color: "yellow"}}>Open up App.tsx to start working on your app!</Text>
      <StatusBar style="auto" />
    </View>
    
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#252ddd',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
